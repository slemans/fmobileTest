//
//  NewsCellTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 19.05.23.
//

import XCTest
@testable import DemoMVVM

final class NewsCellTests: XCTestCase {
    
    private var sut: NewsCell!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = NewsCell()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_setupCell() {
        // Given
        let model = NewsViewModel.Model.decription(.emptyLine)
        var resultWork: Bool = false
        func setupCell(model: NewsViewModel.Model) {
            sut.setupCell(model: model)
            resultWork = true
        }
        // When
        setupCell(model: model)
        // Then
        XCTAssert(resultWork)
    }

}
