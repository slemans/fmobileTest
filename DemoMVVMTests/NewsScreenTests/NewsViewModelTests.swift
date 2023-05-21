//
//  NewsViewModelTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 19.05.23.
//

import XCTest
@testable import DemoMVVM

final class NewsViewModelTests: XCTestCase {
    
    private var sut: NewsViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let listNews = ListNews(
            title: "Demo",
            description: "Demo",
            imageURL: "http://dummyimage.com/156x100.png/5fa2dd/ffffff",
            id: 1,
            createAt: "1647249381000"
        )
        self.sut = NewsViewModel(model: listNews)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_get_titlePage() {
        // Given
        func getTitle() -> String {
            sut.getTitlePage()
        }
        // When
        let result = getTitle()
        // Then
        XCTAssertNotNil(result)
    }
    
    func test_numberOfRows() {
        // Given
        let result = sut.numberOfRows()
        // Then
        XCTAssertNotEqual(result, 0)
    }
    
    func test_cellViewModel() {
        // Given
        let index = IndexPath(item: 0, section: 0)
        let result = sut.cellViewModel(forIndexPath: index)
        // Then
        XCTAssertNotNil(result)
    }

}
