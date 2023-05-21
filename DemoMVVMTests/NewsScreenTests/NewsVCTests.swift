//
//  NewsVCTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 19.05.23.
//

import XCTest
@testable import DemoMVVM

final class NewsVCTests: XCTestCase {
    
    private var sut: NewsVC!
    private var viewModel: NewsViewModelSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = NewsVC()
        self.viewModel = NewsViewModelSpy()
        sut.viewModel = viewModel
    }

    override func tearDownWithError() throws {
        sut = nil
        viewModel = nil
        try super.tearDownWithError()
    }
    
    func test_view_didLoad() {
        // Given
        func viewDidLoad() {
            sut.viewDidLoad()
        }
        // When
        viewDidLoad()
        // Then
        XCTAssertEqual(viewModel.getTitlePage() , sut.navigationItem.title)
    }
    
    func test_tableView_numberOfRowsInSection() {
        // Given
        let table = UITableView()
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            sut.tableView(tableView, numberOfRowsInSection: section)
        }
        // When
        let result = tableView(table, numberOfRowsInSection: 0)
        // Then
        XCTAssertEqual(result, viewModel.array.count)
    }
    
    func test_tableView_cellForRowAt() {
        // Given
        let table: UITableView = {
            let tableView = UITableView(frame: .zero)
            tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
            return tableView
        }()
        let index = IndexPath(item: 0, section: 0)
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            sut.tableView(tableView, cellForRowAt: indexPath)
        }
        // When
        let result = tableView(table, cellForRowAt: index)
        // Then
        XCTAssertNotNil(result)
    }

}
