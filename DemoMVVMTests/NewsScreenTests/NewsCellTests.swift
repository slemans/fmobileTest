//
//  NewsCellTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 19.05.23.
//

import XCTest
@testable import DemoMVVM

final class NewsCellTests: XCTestCase {
    
    private var cell: NewsCell!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.cell = NewsCell()
    }

    override func tearDownWithError() throws {
        cell = nil
        try super.tearDownWithError()
    }
    
    func testSetupCell() {
        // Given
        let model = NewsViewModel.Model.decription(.emptyLine)
        var resultWork: Bool = false
        func setupCell(model: NewsViewModel.Model) {
            cell.setupCell(model: model)
            resultWork = true
        }
        // When
        setupCell(model: model)
        // Then
        XCTAssert(resultWork)
    }

}
