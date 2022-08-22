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
        layout.minimumLineSpacing = Constants.minimumLineSpacing
        layout.minimumInteritemSpacing = Constants.minimumInteritemSpacing
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.contentInset = Constants.collectionViewContentInset
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
    
    // MARK: - Initialize
    
    init(
        presenter: IMovieBrowserPresenter
    ) {
        self.presenter = presenter
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
        configurateNavBar()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setTintColor(.white)
        navigationController?.backgroundColor(.black)
    }
    
    // MARK: - Private
    
    private func configurateNavBar() {
        title = Constants.movieBrowserTitle
        
        // RightButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: Constants.searchImage,
            style: .plain,
            target: self,
            action: #selector(searchButtonTapped)
        )
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        // LeftButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: Constants.profileImage,
            style: .plain,
            target: self,
            action: #selector(profileButtonTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    private func setUpUI() {
        view.addSubview(scrollViewContainer)
        scrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    //MARK: - Action
    
    @objc private func profileButtonTapped() { }
    
    @objc private func searchButtonTapped() { }
   
}

// MARK: - UICollectionViewDataSource

extension MovieBrowserViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        presenter.didSelectItem(at: indexPath)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        presenter.numberOfItems
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
    func setActivityLoaderEnabled(_ enabled: Bool) { }
    
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
        return CGSize(
            width: (view.frame.width / 2) - .spaceSeparator,
            height: (view.frame.height / 3)
        )
    }
}

// MARK: - Constants

private enum Constants {
    static let minimumLineSpacing = 1.0
    static let minimumInteritemSpacing = 1.0
    static let collectionViewContentInset = UIEdgeInsets(
        top: .margin34,
        left: .zero,
        bottom: .zero,
        right: .zero
    )
    
    static let profileImage = UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysTemplate)
    static let searchImage = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)
    
    static let movieBrowserTitle = "Movie Browser"
}

private extension UINavigationController {
    func transparentNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }

    func setTintColor(_ color: UIColor) {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        self.navigationBar.tintColor = color
    }

    func backgroundColor(_ color: UIColor) {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.barTintColor = color
        navigationBar.shadowImage = UIImage()
    }
}
