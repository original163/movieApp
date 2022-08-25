//
//  RequestManager.swift
//  movieApp
//
//  Created by Денис Денисов on 22.08.2022.
//

import Foundation

protocol IRequestManager: AnyObject {
    
    func execute<Request: IRequest & IModeledRequest, Model>(
        _ request: Request,
        completion: @escaping (AFDataResponse<Model>) -> Void
    ) where Model == Request.ResponseModel
}

final class RequestManager: IRequestManager {
    
    // Dependencies
    let queue: DispatchQueue
    
    // MARK: - Initialize
    
    init(queue: DispatchQueue = .global(qos: .userInitiated)) {
        self.queue = queue
    }
    
    // MARK: - IRequestManager
    
    func send<ResponseModel: Decodable>(
        _ request: IRequest,
        completion: @escaping (AFDataResponse<ResponseModel>) -> Void
    ) {
        AF.request(request).responseDecodable(queue: queue, completionHandler: completion)
    }
    
    func send(
        _ request: IRequest,
        completion: @escaping (AFDataResponse<Data>) -> Void
    ) {
        AF.request(request).responseData(queue: queue, completionHandler: completion)
    }
    
    func execute<Request: IRequest & IModeledRequest, Model>(
        _ request: Request,
        completion: @escaping (AFDataResponse<Model>) -> Void
    ) where Model == Request.ResponseModel {
        AF.request(request).responseDecodable(queue: queue, completionHandler: completion)
    }
}

