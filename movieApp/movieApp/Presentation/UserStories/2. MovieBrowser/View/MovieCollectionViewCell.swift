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
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    private lazy var movietype: UILabel  = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    private lazy var movieYear: UILabel  = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 8)
        return label
    }()
    private lazy var movieDuration: UILabel  = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 8)
        return label
    }()
    private lazy var movieRating: UILabel  = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    private lazy var descriptionView: UIStackView = {
        let fullStackView = UIStackView()
        
        let topStackView: UIStackView  = {
            let topStackView = UIStackView()
            topStackView.axis = .vertical
            topStackView.addArrangedSubview(movieTitle)
            topStackView.addArrangedSubview(movietype)
            return topStackView
        }()
        
        let bottomStackView: UIStackView = {
            let bottomStackView = UIStackView()
            bottomStackView.axis = .vertical
            bottomStackView.distribution = .fillEqually
            
            let movieYearStackView: UIStackView = {
                let yearImageView = UIImageView()
                yearImageView.image = UIImage(systemName: "film")?.withRenderingMode(.alwaysTemplate)
                yearImageView.tintColor = .white
                yearImageView.contentMode = .scaleAspectFit
                let stack = UIStackView()
                stack.axis = .horizontal
                stack.addArrangedSubview(yearImageView)
                stack.addArrangedSubview(movieYear)
                return stack
            }()
            let movieDurationStackView: UIStackView = {
                let durationImageView = UIImageView()
                durationImageView.image = UIImage(systemName: "timer")?.withRenderingMode(.alwaysTemplate)
                durationImageView.tintColor = .white
                durationImageView.contentMode = .scaleAspectFit
                let stack = UIStackView()
                stack.axis = .horizontal
                stack.addArrangedSubview(durationImageView)
                stack.addArrangedSubview(movieDuration)
                return stack
            }()
            let movieRatingStackView: UIStackView = {
                let ratingImageView = UIImageView()
                ratingImageView.image = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
                ratingImageView.tintColor = .white
                ratingImageView.contentMode = .scaleAspectFit
                let stack = UIStackView()
                stack.axis = .horizontal
                stack.addArrangedSubview(ratingImageView)
                stack.addArrangedSubview(movieRating)
                return stack
            }()
            
            bottomStackView.addArrangedSubview(movieYearStackView)
            bottomStackView.addArrangedSubview(movieDurationStackView)
            bottomStackView.addArrangedSubview(movieRatingStackView)
            return bottomStackView
        }()
        
        fullStackView.layoutMargins = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        fullStackView.isLayoutMarginsRelativeArrangement = true
        fullStackView.addBackground(color: .black.withAlphaComponent(0.5))
        fullStackView.axis = .vertical
        fullStackView.addArrangedSubview(topStackView)
        fullStackView.addArrangedSubview(bottomStackView)
        return fullStackView
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
        
    }
  
    // MARK: - Private

    private func setUpUI() {
        
        layer.cornerRadius = 12
        clipsToBounds = true
        contentView.layer.cornerRadius = 12
        
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
            descriptionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)
            
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
        let movieYear: String
        let movieRating: Float
    }
    
    func configure(with model: ConfigurationModel) {
        movieTitle.text = model.movieTitle
        movietype.text = model.movieType
        movieDuration.text = model.movieDuration
        movieYear.text = model.movieYear
        movieRating.text = String(model.movieRating)
    }
}


private extension UIStackView {
    /*
     UIStackView is a non-drawing view, meaning that  drawRect() is never called and its background color is ignored. If you desperately want a background color, consider placing the stack view inside another UIView and giving that view a background color.
     */
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
