//
//  MovieService.swift
//  movieApp
//
//  Created by Денис Денисов on 22.08.2022.
//

protocol IMovieService: AnyObject {
    
    func performRequest(complition: @escaping (Error?) -> Void)
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
    
    func performRequest(complition: @escaping (Error?) -> Void) {
//        let request = FeedbackRequest(feedback: feedback)
//        requestManager.send(request) { response in
//            DispatchQueue.main.async {
//                complition(response.error)
//            }
//        }
    }
}
