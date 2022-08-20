//
//  MovieBrowserViewController.swift
//  movieApp
//
//  Created by Денис Денисов on 19.08.2022.
//

import UIKit

protocol IMovieBrowserView: AnyObject {
    func updateView()
    func setActivityLoaderEnabled(_ enabled: Bool)
}

final class MovieBrowserViewController: UIViewController {
    
    // UI
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .gray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(MovieCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    private lazy var scrollViewContainer = MaskedContainerView(containedView: collectionView)
    
    // Dependencies
    private let presenter: IMovieBrowserPresenter
//    private let layoutStyle: LayoutStyle
    
    // MARK: - Initialize
    
    init(
        presenter: IMovieBrowserPresenter
//        layoutStyle: SRLayoutStyle
    ) {
        self.presenter = presenter
//        self.layoutStyle = layoutStyle
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        presenter.viewDidLoad()
        configurateNavBar()
    }
    
    // MARK: - Private
    
    private func configurateNavBar() {
        
        
        let button = UIButton(type: .system)
        button.setTitle("skip", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.tintColor = .white
        button.addTarget(self, action: #selector(barButtonTapped), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    private func setUpUI() {
        title = "Movie Browser"
        view.addSubview(scrollViewContainer)
        scrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
//        if layoutStyle.isPad {
//            headerView.titleLabel.textAlignment = .center
//            headerView.subtitleLabel.textAlignment = .center
//            collectionView.contentInset = .padInsets
//        } else {
//            collectionView.contentInset = .phoneInsets
//        }
    }
    
    //MARK: - Action
    @objc func barButtonTapped() {
//        delegate?.didTapButtonProfile()
        
    }
    
    @objc func toSearchButtonTapped() {
//        let searchVC =  SearchMovieViewController()
//        self.navigationController?.pushViewController(searchVC, animated: true)
    }
   
    @objc func handleDismissal() {
//        dismissInfoView()
    }
    
    
}

// MARK: - UICollectionViewDataSource

extension MovieBrowserViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let cell = collectionView.dequeueReusableCell(
            MovieCollectionViewCell.self,
            for: indexPath
        ) as SelectableView
        
        cell.isSelected.toggle()
        presenter.didSelectItem(at: indexPath)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        presenter.numberOfItems()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            MovieCollectionViewCell.self,
            for: indexPath
        )
        
        let model = presenter.viewModel(for: indexPath)
        cell.configure(with: model)
        
        return cell
    }
}

// MARK: - IMovieBrowserView

extension MovieBrowserViewController: IMovieBrowserView {
    func setActivityLoaderEnabled(_ enabled: Bool) {
        
    }
    
    
    func updateView() {
        let range = Range(uncheckedBounds: (.zero, collectionView.numberOfSections))
        let indexSet = IndexSet(integersIn: range)
        collectionView.reloadSections(indexSet)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MovieBrowserViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let defaultCellWidth = collectionView.frame.width / 2
        
        let defaultCellSize = CGSize(
            width: defaultCellWidth,
            height: .defaultCellHeight
        )
        
//        switch layoutStyle {
//        case .phone:
//            return defaultCellSize
//
//        case .pad:
//            guard
//                let layout = collectionViewLayout as? UICollectionViewFlowLayout
//            else { return defaultCellSize }
//
//            let minimumInteritemSpacing = layout.minimumInteritemSpacing
//            let padCellWidth = (defaultCellWidth - minimumInteritemSpacing) / .countOfCellsInRow
//
//            return CGSize(
//                width: padCellWidth,
//                height: .defaultCellHeight
//            )
//        }
        
        return CGSize(width: (view.frame.size.width/2)-0.5,
                      height: (view.frame.size.width/1.3)-9)
    }
}

// MARK: - Constants

private extension CGFloat {
    static let margin26 = 26.0
    static let margin80 = 80.0
    static let defaultCellHeight = 100.0
    static let countOfCellsInRow = 2.0
    static let buttonWidth = 375.0
}

private extension UIEdgeInsets {
    static let phoneInsets = UIEdgeInsets(
        top: 26,
        left: 16,
        bottom: 96,
        right: 16
    )
}
