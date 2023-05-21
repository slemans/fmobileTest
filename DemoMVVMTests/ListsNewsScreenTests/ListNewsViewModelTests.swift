//
//  ListNewsViewModelTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 18.05.23.
//

import XCTest
@testable import DemoMVVM

final class ListNewsViewModelTests: XCTestCase {

    private var sut: ListNewsViewModel!
    private var cordinator: ListNewsViewModelCoordinatorOutputSpy!
    private var networkService: NewsServiceProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.cordinator = ListNewsViewModelCoordinatorOutputSpy()
        self.networkService = NewsServiceProtocolSpy()
        self.sut = ListNewsViewModel(output: cordinator, servise: networkService)
    }

    override func tearDownWithError() throws {
        cordinator = nil
        networkService = nil
        sut = nil
        try super.tearDownWithError()
    }

    func test_getTitle() {
        // Given
        func getTitle() -> String {
            sut.getTitle()
        }
        // When
        let result = getTitle()
        // Then
        XCTAssertNotNil(result)
    }
    func test_goToScreenFullNews() {
        // Given
        let index = IndexPath(item: 0, section: 0)
        func goToScreenFullNews(model: IndexPath) {
            sut.goToScreenFullNews(model: model)
        }
        // When
        goToScreenFullNews(model: index)
        // Then
        XCTAssertNotNil(cordinator.count)
    }
    func test_fetchNews() {
        // Given
        var resultWork: Bool = false
        sut.fetchNews {
            resultWork = true
        }
        // Then
        XCTAssert(resultWork)
    }
    func test_returnSortArray() {
        // Given
        let model = [ListNews]()
        let result = sut.returnSortArray(model)
        // Then
        XCTAssertNotNil(result)
    }

    func test_numberOfRows() {
        // Given
        let result = sut.numberOfRows()
        // Then
        XCTAssertEqual(result, 0)
    }

}
