//
//  Movie.swift
//  movieApp
//
//  Created by Денис Денисов on 22.08.2022.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let genre: String
    let release: String
    let rating: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case genre = "Genre"
        case release = "Year"
        case rating = "imdbRating"
    }
    
    init(
        title: String,
        genre: String,
        release: String,
        rating: String
    ) {
        self.title = title
        self.genre = genre
        self.release = release
        self.rating = rating
    }
}
