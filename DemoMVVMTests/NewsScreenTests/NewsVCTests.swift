//
//  NewsVCTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 19.05.23.
//

import XCTest
@testable import DemoMVVM

final class NewsVCTests: XCTestCase {
    
    private var screen: NewsVC!
    private var viewModel: NewsViewModelSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.screen = NewsVC()
        self.viewModel = NewsViewModelSpy()
        screen.viewModel = viewModel
    }

    override func tearDownWithError() throws {
        screen = nil
        viewModel = nil
        try super.tearDownWithError()
    }
    
    func testViewDidLoad() {
        // Given
        func viewDidLoad() {
            screen.viewDidLoad()
        }
        // When
        viewDidLoad()
        // Then
        XCTAssertEqual(viewModel.getTitlePage() , screen.navigationItem.title)
    }
    
    func testtableViewNumberOfRowsInSection() {
        // Given
        let table = UITableView()
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            screen.tableView(tableView, numberOfRowsInSection: section)
        }
        // When
        let result = tableView(table, numberOfRowsInSection: 0)
        // Then
        XCTAssertEqual(result, viewModel.array.count)
    }
    
    func testTableViewCellForRowAt() {
        // Given
        let table: UITableView = {
            let tableView = UITableView(frame: .zero)
            tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
            return tableView
        }()
        let index = IndexPath(item: 0, section: 0)
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            screen.tableView(tableView, cellForRowAt: indexPath)
        }
        // When
        let result = tableView(table, cellForRowAt: index)
        // Then
        XCTAssertNotNil(result)
    }

}

final class NewsViewModelSpy: NewsViewModelInput {
    
    var array: [NewsViewModel.Model] = [
        NewsViewModel.Model.decription("Description")
    ]
    let title =  "Title"
    
    func numberOfRows() -> Int {
        array.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DemoMVVM.NewsViewModel.Model {
        array[indexPath.row]
    }
    
    func getTitlePage() -> String {
        title
    }
    
}
