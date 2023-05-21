//
//  NewsServiceProtocolSpy.swift
//  DemoMVVMTests
//
//  Created by Павел on 21.05.23.
//

import XCTest
@testable import DemoMVVM

final class NewsServiceProtocolSpy: NewsServiceProtocol {
    
    func fetchImage(url: String, completion: @escaping CompletionHandler<UIImage?>) {
        let image = UIImage()
        completion(.success(image))
    }
    

    func getNews(completion: @escaping CompletionHandler<[DemoMVVM.ListNews]>) {
        let array = [ListNews(
            title: "Demo",
            description: "Demo",
            imageURL: "http://dummyimage.com/156x100.png/5fa2dd/ffffff",
            id: 1,
            createAt: "1647249381000"
        )]
        completion(.success(array))
    }

}
