//
//  MovieDescriptionView.swift
//  movieApp
//
//  Created by Денис Денисов on 22.08.2022.
//

import UIKit

final class MovieDescriptionView: UIView {
    
    // UI
    let title: UILabel = {
        let label = UILabel()
        label.numberOfLines = .titleNumberOfLines
        label.font = .systemFont(ofSize: .size15, weight: .bold)
        label.textColor = .white
        return label
    }()
    let typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: .size12)
        label.textColor = .white
        return label
    }()
    let releaseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: .size12)
        label.textColor = .white
        return label
    }()
    let durationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .movieDurationImage
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let durationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: .size10)
        label.textColor = .white
        return label
    }()
    let ratingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .movieRatingImage
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: .size12, weight: .bold)
        label.textColor = .white
        return label
    }()
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setUpUI() {
        backgroundColor = .black.withAlphaComponent(.alpha50)
        
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .margin4),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .margin4),
            title.topAnchor.constraint(equalTo: topAnchor, constant: .margin4)
        ])
        
        addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            typeLabel.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            typeLabel.topAnchor.constraint(equalTo: title.bottomAnchor)
        ])
        
        addSubview(releaseLabel)
        releaseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            releaseLabel.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor),
            releaseLabel.topAnchor.constraint(equalTo: title.bottomAnchor)
        ])
        
        addSubview(durationImageView)
        durationImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            durationImageView.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            durationImageView.heightAnchor.constraint(equalToConstant: .size13),
            durationImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.margin4)
        ])
        
        addSubview(durationLabel)
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            durationLabel.leadingAnchor.constraint(equalTo: durationImageView.trailingAnchor),
            durationLabel.bottomAnchor.constraint(equalTo: durationImageView.bottomAnchor)
        ])
        
        addSubview(ratingLabel)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.margin8),
            ratingLabel.bottomAnchor.constraint(equalTo: durationImageView.bottomAnchor)
        ])
        
        addSubview(ratingImage)
        ratingImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingImage.trailingAnchor.constraint(equalTo: ratingLabel.leadingAnchor),
            ratingImage.bottomAnchor.constraint(equalTo: ratingLabel.bottomAnchor),
            ratingImage.heightAnchor.constraint(equalToConstant: .size13)
        ])
    }
}

private extension UIImage {
    static let movieDurationImage = UIImage(systemName: "timer")?.withRenderingMode(.alwaysTemplate)
    static let movieRatingImage = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
}

private extension Int {
    static let titleNumberOfLines = 2
}
