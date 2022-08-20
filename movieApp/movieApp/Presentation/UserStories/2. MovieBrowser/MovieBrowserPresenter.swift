//
//  MovieBrowserPresenter.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

import Foundation

protocol IMovieBrowserPresenter: AnyObject {
    func viewDidLoad()
    func numberOfItems() -> Int
    func didSelectItem(at indexPath: IndexPath)
    func viewModel(for indexPath: IndexPath) -> MovieCollectionViewCell.ConfigurationModel
}

final class MovieBrowserPresenter: IMovieBrowserPresenter {
    
    // Dependencies
    weak var view: IMovieBrowserView?
    private var dataHolder: IMovieBrowserDataHolder
    
    // MARK: - Initialize
    
    init(
        view: IMovieBrowserView? = nil,
        dataHolder: IMovieBrowserDataHolder
    ) {
        self.view = view
        self.dataHolder = dataHolder
    }
    
    // MARK: - IMovieBrowserPresenter

    
    func viewDidLoad() {
        
    }
    
    func numberOfItems() -> Int {
        return 9
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        
    }
    
    func viewModel(for indexPath: IndexPath) -> MovieCollectionViewCell.ConfigurationModel {
        return MovieCollectionViewCell.ConfigurationModel(id: 1, title: "title")
    }
}
