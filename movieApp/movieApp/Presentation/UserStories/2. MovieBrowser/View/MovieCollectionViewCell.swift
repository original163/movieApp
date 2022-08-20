//
//  MovieCollectionViewCell.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    
    // UI
    private lazy var categoryImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .red
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.addArrangedSubview(categoryImageView)
        stackView.addArrangedSubview(categoryLabel)
        return stackView
    }()
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.layer.backgroundColor = UIColor.clear.cgColor
        categoryImageView.tintColor = .white
        categoryLabel.textColor = .white
    }
  
    // MARK: - Private

    private func setUpUI() {
        contentView.layer.cornerRadius = 12
        layer.cornerRadius = 12
        contentView.addSubview(stackView)
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 100),
        ])
//        stackView.snp.makeConstraints {
//            $0.left.right.equalToSuperview().inset(CGFloat.margin16)
//            $0.top.bottom.equalToSuperview()
//        }
//        categoryImageView.snp.makeConstraints {
//            $0.width.equalTo(CGFloat.size24)
//        }
//        categoryLabel.snp.makeConstraints {
//            $0.right.bottom.equalToSuperview()
//        }
    }
}

// MARK: - ReuseIdentifierable

extension MovieCollectionViewCell: ReuseIdentifierable { }

// MARK: - SRSelectableView

extension MovieCollectionViewCell: SelectableView {
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.layer.backgroundColor = UIColor.white.cgColor
                categoryImageView.tintColor = UIColor.white
                categoryLabel.textColor = UIColor.white
            } else {
                contentView.layer.backgroundColor = UIColor.clear.cgColor
                categoryImageView.tintColor = UIColor.black
                categoryLabel.textColor = UIColor.black
            }
        }
    }
}

// MARK: - ConfigurableView

extension MovieCollectionViewCell: ConfigurableView {
    
    struct ConfigurationModel {
        let id: Int
        let title: String
//        let iconProvider: SRImageProvider
        var isSelected: Bool = false
    }
    
    func configure(with model: ConfigurationModel) {
        isSelected = model.isSelected
        categoryLabel.text = model.title
//        categoryImageView.apply(model.iconProvider)
    }
}
