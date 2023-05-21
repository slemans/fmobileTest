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

    func test_start() {
        // Given
        func start() {
            sut.start()
        }
        // When
        start()
        // Then
        XCTAssertNotNil(window.rootViewController)
    }

    func test_go_to_fullNews() {
        // Given
        let news = ListNews(
            title: "Demo",
            description: "Demo",
            imageURL: "http://dummyimage.com/156x100.png/5fa2dd/ffffff",
            id: 1,
            createAt: "1647249381000"
        )
        func goToFullNews(_ news: ListNews?) {
            sut.start()
            sut.goToFullNews(news)
        }
        // When
        goToFullNews(news)

        guard let navigationController = window.rootViewController as? UINavigationController else { return }
        
        RunLoop.current.run(until: Date())
        guard let _ = navigationController.topViewController as? NewsVC else {
            XCTFail()
            return
        }
    }

}
