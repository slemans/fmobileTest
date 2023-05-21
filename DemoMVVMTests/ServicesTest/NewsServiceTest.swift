//
//  NewsServiceTest.swift
//  DemoMVVMTests
//
//  Created by Павел on 18.05.23.
//

import XCTest
@testable import DemoMVVM

final class NewsServiceTest: XCTestCase {
    
    private var sut: NewsService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = NewsService.shared
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_get_news() {
        // Given
        sut.getNews { result in
            switch result {
            case .success(let array):
                // Then
                XCTAssertNotNil(array)
            case .failure(let error):
                // Then
                XCTFail("Error =\(error)")
            }
        }
    }
    
    func test_fetch_image() {
        // Given
        let urlImage = "http://dummyimage.com/156x100.png/5fa2dd/ffffff"
        sut.fetchImage(url: urlImage) { result in
            switch result {
            case .success(let image):
                // Then
                XCTAssertNotNil(image)
            case .failure(let error):
                // Then
                XCTFail("Error =\(error)")
            }
        }
    }

}
