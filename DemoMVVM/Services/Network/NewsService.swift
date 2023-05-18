//
//  ShopThingsService.swift
//  shopDemo
//
//  Created by Павел on 27.03.23.
//

import Foundation
import Moya


protocol NewsServiceProtocol {
    
    typealias CompletionHandler<T> = (Result<T, Error>) -> Void
    func getNews(completion: @escaping CompletionHandler<[ListNews]>)
    
}

struct NewsService {
    
    let provider = MoyaProvider<NewsServiceTarget>()
    
    static let shared = NewsService()
    private init() { }
    
}

// MARK: - Function RegistrationService

extension NewsService: NewsServiceProtocol {
    
    func getNews(completion: @escaping CompletionHandler<[ListNews]>) {
        provider.request(.getNews) { result in
            switch result {
            case .success(let response):
                do {
                    let result = try response.map([ListNews].self)
                    completion(.success(result))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
