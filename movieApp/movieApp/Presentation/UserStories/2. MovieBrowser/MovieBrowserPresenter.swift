//
//  MovieBrowserPresenter.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

import Foundation

protocol IMovieBrowserPresenter: AnyObject {
    func viewDidLoad()
    var numberOfItems: Int { get }
    func didSelectItem(at indexPath: IndexPath)
    func viewModel(for indexPath: IndexPath) -> MovieCollectionViewCell.ConfigurationModel
}

final class MovieBrowserPresenter: IMovieBrowserPresenter {
    
    // Dependencies
    weak var view: IMovieBrowserView?
    private var dataHolder: IMovieBrowserDataHolder
    private var movieService: IMovieService = MovieService()
    
    // Prorerties
    var numberOfItems: Int {
        return dataHolder.viewModels.count
    }
    
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
        movieService.performRequest { movie in
            let movieViewModel = MovieCollectionViewCell.ConfigurationModel(
                movieTitle: movie.title,
                movieType: movie.genre,
                movieDuration: "2222",
                movieRelease: movie.release,
                movieRating: 2222
            )
            self.dataHolder.viewModels.append(movieViewModel)
        }
    }
        
    func didSelectItem(at indexPath: IndexPath) {
        
    }
    
    func viewModel(for indexPath: IndexPath) -> MovieCollectionViewCell.ConfigurationModel {
        return dataHolder.viewModels[indexPath.row]
    }
}
