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
    
    func test_start() {
        // Given
        func start() {
            sut.start()
        }
        // When
        start()
        // Then
        XCTAssertNotNil(sut.coordinators["ListsNews"])
        XCTAssertNotEqual(sut.coordinators.count, 0)
    }

}
