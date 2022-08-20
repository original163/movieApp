//
//  MovieBrowserAssembly.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

import UIKit

protocol IMovieBrowserAssembly: AnyObject {
    func assemble() -> UIViewController
}

final class MovieBrowserAssembly: IMovieBrowserAssembly {
    
    // Dependencies
//    private lazy var service = Locator.shared.resolveService()
    
    // MARK: - Initialize
    
    init() { }
    
    // MARK: - ICategoryPersonalizationAssembly
    
    func assemble() -> UIViewController {
        
//        let router = CategoryPersonalizationRouter()
        let dataHolder = MovieBrowserDataHolderMock()
        let presenter = MovieBrowserPresenter(dataHolder: dataHolder)
        let controller = MovieBrowserViewController(
            presenter: presenter
        )
        presenter.view = controller
//        router.transitionHandler = controller
        
        return controller
    }
}

