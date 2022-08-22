//
//  MovieBrowserDataHolderMock.swift
//  movieApp
//
//  Created by Денис Денисов on 20.08.2022.
//

final class MovieBrowserDataHolderMock: IMovieBrowserDataHolder {
    typealias model = MovieCollectionViewCell.ConfigurationModel
    var viewModels: [model] = [
        model(movieTitle: "Avengers: Endgame", movieType: "Drama", movieDuration: "2h33min", movieRelease: "2019", movieRating: 4),
        model(movieTitle: "Вones", movieType: "Kriminal, Drama", movieDuration: "77h20min", movieRelease: "2007", movieRating: 5),
        model(movieTitle: "Harry Potter: Something else", movieType: "Comedy", movieDuration: "4h31min", movieRelease: "1995", movieRating: 4),
        model(movieTitle: "King Of Rings", movieType: "Fantasy", movieDuration: "4h33min", movieRelease: "1998", movieRating: 4),
        model(movieTitle: "Age Of Imperia's", movieType: "don't now", movieDuration: "4h43min", movieRelease: "2020", movieRating: 5),
        model(movieTitle: "Toyota6", movieType: "Corolla", movieDuration: "2h33min", movieRelease: "1990", movieRating: 4),
        model(movieTitle: "Toyota7", movieType: "Corolla", movieDuration: "2h33min", movieRelease: "1990", movieRating: 4),
        model(movieTitle: "Toyota8", movieType: "Corolla", movieDuration: "2h33min", movieRelease: "1990", movieRating: 4),
        model(movieTitle: "Toyota9", movieType: "Corolla", movieDuration: "2h33min", movieRelease: "1990", movieRating: 4),
        model(movieTitle: "Toyota10", movieType: "Corolla", movieDuration: "2h33min", movieRelease: "1990", movieRating: 4),
        model(movieTitle: "Toyota11", movieType: "Corolla", movieDuration: "2h33min", movieRelease: "1990", movieRating: 4),
        model(movieTitle: "Toyota12", movieType: "Corolla", movieDuration: "2h33min", movieRelease: "1990", movieRating: 4)
    ]
    
    func fetchDataIfNeeded() { }
    
}
