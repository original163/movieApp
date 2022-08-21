//
//  MovieBrowserDataHolderMock.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

final class MovieBrowserDataHolderMock: IMovieBrowserDataHolder {
    typealias model = MovieCollectionViewCell.ConfigurationModel
    var viewModels: [model] = [
        model(movieTitle: "Avengers: Endgame,Avengers: Endgame", movieType: "Drama", movieDuration: "2h33min", movieYear: "2019", movieRating: 4),
        model(movieTitle: "Toyota2", movieType: "Corolla", movieDuration: "2h33min", movieYear: "1990", movieRating: 4),
        model(movieTitle: "Toyota3", movieType: "Corolla", movieDuration: "2h33min", movieYear: "1990", movieRating: 4),
        model(movieTitle: "Toyota4", movieType: "Corolla", movieDuration: "2h33min", movieYear: "1990", movieRating: 4),
        model(movieTitle: "Toyota5", movieType: "Corolla", movieDuration: "2h33min", movieYear: "1990", movieRating: 4),
        model(movieTitle: "Toyota6", movieType: "Corolla", movieDuration: "2h33min", movieYear: "1990", movieRating: 4),
        model(movieTitle: "Toyota7", movieType: "Corolla", movieDuration: "2h33min", movieYear: "1990", movieRating: 4),
        model(movieTitle: "Toyota8", movieType: "Corolla", movieDuration: "2h33min", movieYear: "1990", movieRating: 4),
        model(movieTitle: "Toyota9", movieType: "Corolla", movieDuration: "2h33min", movieYear: "1990", movieRating: 4),
        model(movieTitle: "Toyota10", movieType: "Corolla", movieDuration: "2h33min", movieYear: "1990", movieRating: 4),
        model(movieTitle: "Toyota11", movieType: "Corolla", movieDuration: "2h33min", movieYear: "1990", movieRating: 4),
        model(movieTitle: "Toyota12", movieType: "Corolla", movieDuration: "2h33min", movieYear: "1990", movieRating: 4)
    ]
}
