//
//  NewsServiceTest.swift
//  DemoMVVMTests
//
//  Created by Павел on 18.05.23.
//

import XCTest
@testable import DemoMVVM

final class NewsServiceTest: XCTestCase {
    
    private var service: NewsService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.service = NewsService.shared
    }

    override func tearDownWithError() throws {
        service = nil
        try super.tearDownWithError()
    }

    func testGetNews() {
        // Given
        service.getNews { result in
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

}
