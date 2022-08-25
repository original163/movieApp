//
//  MovieService.swift
//  movieApp
//
//  Created by Денис Денисов on 22.08.2022.
//

import Foundation

protocol IMovieService: AnyObject {
    
    func performRequest(complition: @escaping (Movie) -> Void)
}

final class MovieService: IMovieService {
    
    // Dependencies
//    private let requestManager: IRequestManager
    
    // MARK: - Initialize
//    
//    init(requestManager: IRequestManager) {
//        self.requestManager = requestManager
//    }
//    
    // MARK: - IMovieService
    
    func performRequest(complition: @escaping (Movie) -> Void) {
        
        let url = URL(string: "https://www.omdbapi.com/?apikey=af899e4&t=Postal")
        guard let url = url else { return }
        var request = URLRequest(url: url)
        let headers = [
        request.httpMethod = "GET"
        request.para
        let session = URLSession.shared
        session.dataTask(with: request) { data, res, error in
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                let decoder = JSONDecoder()
                let movie = try decoder.decode(Movie.self, from: data)
                complition(movie)
            } catch let error {
                print(error)
            }
        }.resume()
        
        
        
        
        
//        let request = FeedbackRequest(feedback: feedback)
//        requestManager.send(request) { response in
//            DispatchQueue.main.async {
//                complition(response.error)
//            }
//        }
    }
}
