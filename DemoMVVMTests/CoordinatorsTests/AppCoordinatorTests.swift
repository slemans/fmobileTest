//
//  AppCoordinatorTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 19.05.23.
//

import XCTest
@testable import DemoMVVM

final class AppCoordinatorTests: XCTestCase {
    
    private var sut: AppCoordinator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let window = UIWindow()
        self.sut = AppCoordinator(window: window)
    }

    override func tearDownWithError() throws {
        sut = nil
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
        XCTAssertNotEqual(sut.coordinators.count, 0)
    }

    func testShowListsNewsPage() {
        // Given
        func showListsNewsPage() {
            sut.showListsNewsPage()
        }
        // When
        showListsNewsPage()
        // Then
        XCTAssertNotEqual(sut.coordinators.count, 0)
    }

}
