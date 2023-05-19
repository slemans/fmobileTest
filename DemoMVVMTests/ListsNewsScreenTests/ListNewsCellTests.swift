//
//  ListNewsCellTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 18.05.23.
//

import XCTest
@testable import DemoMVVM

final class ListNewsCellTests: XCTestCase {
    
    private var cell: ListNewsCell!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.cell = ListNewsCell()
    }

    override func tearDownWithError() throws {
        cell = nil
        try super.tearDownWithError()
    }
    
    func testSetupCell() {
        // Given
        let model = ListNewsViewModel.Model(name: .emptyLine, image: .emptyLine, data: Date(), id: 0)
        var resultWork: Bool = false
        func setupCell(model: ListNewsViewModel.Model) {
            cell.setupCell(model: model)
            resultWork = true
        }
        // When
        setupCell(model: model)
        // Then
        XCTAssert(resultWork)
    }

}
