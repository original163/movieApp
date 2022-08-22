//
//  MovieBrowserDataHolder.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

protocol IMovieBrowserDataHolder: AnyObject {
    func fetchDataIfNeeded()
    var viewModels: [MovieCollectionViewCell.ConfigurationModel] { get set }
}

final class MovieBrowserDataHolder: IMovieBrowserDataHolder {
    var viewModels: [MovieCollectionViewCell.ConfigurationModel] = []
    func fetchDataIfNeeded() {
        
    }
}
