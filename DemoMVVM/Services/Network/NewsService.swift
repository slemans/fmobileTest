//
//  ShopThingsService.swift
//  shopDemo
//
//  Created by Павел on 27.03.23.
//

import UIKit
import Moya


protocol NewsServiceProtocol {

    typealias CompletionHandler<T> = (Result<T, Error>) -> Void
    func getNews(completion: @escaping CompletionHandler<[ListNews]>)
    func fetchImage(url: String, completion: @escaping CompletionHandler<UIImage?>)

}

struct NewsService {

    private let provider = MoyaProvider<NewsServiceTarget>()

    static let shared = NewsService()
    private init() { }

}

// MARK: - Function RegistrationService

extension NewsService: NewsServiceProtocol {

    func fetchImage(url: String, completion: @escaping CompletionHandler<UIImage?>) {
        provider.request(.getImage(url: url)) { result in
            switch result {
            case .success(let imageData):
                let image = UIImage(data: imageData.data)
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }

    }

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
