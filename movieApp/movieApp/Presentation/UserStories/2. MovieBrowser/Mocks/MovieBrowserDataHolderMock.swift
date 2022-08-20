//
//  MovieBrowserDataHolderMock.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

final class MovieBrowserDataHolderMock: IMovieBrowserDataHolder {
    typealias model = MovieCollectionViewCell.ConfigurationModel
    var viewModels: [model] = [
        model(id: 1, title: "1"),
        model(id: 2, title: "2"),
        model(id: 3, title: "3"),
        model(id: 1, title: "1"),
        model(id: 2, title: "2"),
        model(id: 1, title: "1"),
        model(id: 2, title: "2"),
        model(id: 1, title: "1"),
        model(id: 2, title: "2"),
    ]
}
