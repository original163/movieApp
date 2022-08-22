//
//  MovieCollectionViewCell.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    
    // UI
    private lazy var movieImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = .size12
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .white
        label.font = .systemFont(ofSize: .size15)
        return label
    }()
    private lazy var movietype: UILabel  = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: .size13)
        return label
    }()
    private lazy var movieYear: UILabel  = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: .size8)
        return label
    }()
    private lazy var movieDuration: UILabel  = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: .size8)
        return label
    }()
    private lazy var movieRating: UILabel  = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: .size10)
        return label
    }()
    private lazy var descriptionView = MovieDescriptionView()
    
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
        
    }
  
    // MARK: - Private

    private func setUpUI() {
        layer.cornerRadius = .cornerRadius12
        clipsToBounds = true
        
        addSubview(movieImageView)
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieImageView.topAnchor.constraint(equalTo: topAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        addSubview(descriptionView)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            descriptionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: .descriptionViewMultiplayer)
        ])
    }
}

// MARK: - ReuseIdentifierable

extension MovieCollectionViewCell: ReuseIdentifierable { }

// MARK: - ConfigurableView

extension MovieCollectionViewCell: ConfigurableView {
    
    struct ConfigurationModel {
        let movieTitle: String
        let movieType: String
        let movieDuration: String
        let movieRelease: String
        let movieRating: Float
    }
    
    func configure(with model: ConfigurationModel) {
        descriptionView.title.text = model.movieTitle
        descriptionView.typeLabel.text = model.movieType + .middleDot
        descriptionView.releaseLabel.text = model.movieRelease
        descriptionView.durationLabel.text = model.movieDuration
        descriptionView.ratingLabel.text = String(model.movieRating)
    }
}

private extension String {
    static let middleDot = " · "
}

private extension CGFloat {
    static let descriptionViewMultiplayer = 0.25
}
