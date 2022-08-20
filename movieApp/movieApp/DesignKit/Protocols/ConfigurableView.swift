//
//  ConfigurableView.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

protocol ConfigurableView {
    associatedtype ConfigurationModel
    func configure(with model: ConfigurationModel)
}
