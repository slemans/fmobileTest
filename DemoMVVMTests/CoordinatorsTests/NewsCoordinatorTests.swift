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
    private var window: WindowSpy!

    override func setUpWithError() throws {
        let listNews = ListNews(
            title: "Demo",
            description: "Demo",
            imageURL: "http://dummyimage.com/156x100.png/5fa2dd/ffffff",
            id: 1,
            createAt: "1647249381000"
        )
        self.window = WindowSpy()
        self.sut = NewsCoordinator(news: listNews)
    }

    override func tearDownWithError() throws {
        sut = nil
        window = nil
        try super.tearDownWithError()
    }
    
    func test_Start() {
        // Given
        func start() {
            sut.start()
        }
        // When
        start()
        RunLoop.current.run(until: Date())
        // Then
        guard let _ = sut.makeScreen() as? NewsVC else {
            XCTFail()
            return
        }
    }
    
    func test_make_screen() {
        // Given
        sut.start()
        func makeScreen() -> UIViewController {
            sut.makeScreen()
        }
        // When
        let result = makeScreen()
        // Then
        RunLoop.current.run(until: Date())
        guard let _ = result as? NewsVC else {
            XCTFail()
            return
        }
    }

}
