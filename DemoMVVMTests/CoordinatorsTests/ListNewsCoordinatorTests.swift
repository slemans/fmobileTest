//
//  ListNewsCoordinatorTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 19.05.23.
//

import XCTest
@testable import DemoMVVM

final class ListNewsCoordinatorTests: XCTestCase {
    
    private var sut: ListNewsCoordinator!
    private var window: WindowSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.window = WindowSpy()
        self.sut = ListNewsCoordinator(window: window)
    }

    override func tearDownWithError() throws {
        sut = nil
        window = nil
        try super.tearDownWithError()
    }
    
    func testStart() {
        // Given
        func start() {
            sut.start()
        }
        // When
        start()
        // Then
        XCTAssertNotNil(window.rootViewController)
    }
    
    func testGoToFullNews() {
        // Given
        let news = ListNews(
            title: "Demo",
            description: "Demo",
            imageURL: "http://dummyimage.com/156x100.png/5fa2dd/ffffff",
            id: 1,
            createAt: "1647249381000"
        )
        var resultWork: Bool = false
        func goToFullNews(_ news: ListNews?) {
            sut.goToFullNews(news)
            resultWork = true
        }
        // When
        goToFullNews(news)
        // Then
        XCTAssert(resultWork)
    }

}

final class WindowSpy: UIWindow {}
