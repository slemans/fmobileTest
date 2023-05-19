//
//  NewsViewModelTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 19.05.23.
//

import XCTest
@testable import DemoMVVM

final class NewsViewModelTests: XCTestCase {
    
    private var viewModel: NewsViewModel!
    private var output: NewsViewModelCoordinatorOutputSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.output = NewsViewModelCoordinatorOutputSpy()
        let listNews = ListNews(
            title: "Demo",
            description: "Demo",
            imageURL: "http://dummyimage.com/156x100.png/5fa2dd/ffffff",
            id: 1,
            createAt: "1647249381000"
        )
        self.viewModel = NewsViewModel(output: output, model: listNews)
    }

    override func tearDownWithError() throws {
        output = nil
        viewModel = nil
        try super.tearDownWithError()
    }

    func testGetTitlePage() {
        // Given
        func getTitle() -> String {
            viewModel.getTitlePage()
        }
        // When
        let result = getTitle()
        // Then
        XCTAssertNotNil(result)
    }
    
    func testNumberOfRows() {
        // Given
        let result = viewModel.numberOfRows()
        // Then
        XCTAssertEqual(result, 0)
    }
    
    func testCellViewModel() {
        // Given
        let index = IndexPath(item: 0, section: 0)
        let result = viewModel.cellViewModel(forIndexPath: index)
        // Then
        XCTAssertNotNil(result)
    }

}

final class NewsViewModelCoordinatorOutputSpy: NewsViewModelOutput { }
