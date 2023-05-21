//
//  DemoMVVMTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 18.05.23.
//

import XCTest
@testable import DemoMVVM

final class ListNewsVCTests: XCTestCase {
    
    private var sut: ListNewsVC!
    private var viewModel: ListNewsViewModelSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = ListNewsVC()
        self.viewModel = ListNewsViewModelSpy()
        sut.viewModel = viewModel
    }

    override func tearDownWithError() throws {
        sut = nil
        viewModel = nil
        try super.tearDownWithError()
    }
    
    func test_viewDidLoad() {
        // Given
        func viewDidLoad() {
            sut.viewDidLoad()
        }
        // When
        viewDidLoad()
        // Then
        XCTAssertEqual(viewModel.countViewDidLoad, 1)
    }
    
    func test_viewWillAppear() {
        // Given
        func viewWillAppear(_ animated: Bool) {
            sut.viewWillAppear(animated)
        }
        // When
        viewWillAppear(true)
        // Then
        XCTAssertEqual(sut.navigationItem.title, viewModel.getTitle())
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
            tableView.register(ListNewsCell.self, forCellReuseIdentifier: ListNewsCell.identifier)
            return tableView
        }()
        let index = IndexPath(item: 0, section: 0)
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            sut.tableView(tableView, cellForRowAt: indexPath)
        }
        // When
        let rusult = tableView(table, cellForRowAt: index)
        // Then
        XCTAssertNotNil(rusult)
    }
    
    func test_tableView_didSelectRowAt() {
        // Given
        let table = UITableView()
        let index = IndexPath(item: 0, section: 0)
        func tableView(_ tableView: UITableView, didSelectRowAt: IndexPath) {
            sut.tableView(tableView, didSelectRowAt: didSelectRowAt)
        }
        // When
        tableView(table, didSelectRowAt: index)
        // Then
        XCTAssertEqual(viewModel.index, index)
    }
    
}
