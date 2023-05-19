//
//  NewsCoordinatorTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 19.05.23.
//

import XCTest
@testable import DemoMVVM

final class NewsCoordinatorTests: XCTestCase {
    
    private var sut: NewsCoordinator!

    override func setUpWithError() throws {
        let listNews = ListNews(
            title: "Demo",
            description: "Demo",
            imageURL: "http://dummyimage.com/156x100.png/5fa2dd/ffffff",
            id: 1,
            createAt: "1647249381000"
        )
        self.sut = NewsCoordinator(news: listNews)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testStart() {
        // Given
        var resultWork: Bool = false
        func start() {
            sut.start()
            resultWork = true
        }
        // When
        start()
        // Then
        XCTAssert(resultWork)
    }
    
    func testMakeScreen() {
        // Given
        func makeScreen() -> UIViewController {
            sut.makeScreen()
        }
        // When
        let result = makeScreen()
        // Then
        XCTAssertNotNil(result)
    }

}
