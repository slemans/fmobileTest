//
//  DemoMVVMTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 18.05.23.
//

import XCTest
@testable import DemoMVVM

final class ListNewsVCTests: XCTestCase {
    
    private var screen: ListNewsVC!
    private var viewModel: ListNewsViewModelSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.screen = ListNewsVC()
        self.viewModel = ListNewsViewModelSpy()
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
        XCTAssertEqual(viewModel.countViewDidLoad, 1)
    }
    
    func testViewWillAppear() {
        // Given
        func viewWillAppear(_ animated: Bool) {
            screen.viewWillAppear(animated)
        }
        // When
        viewWillAppear(true)
        // Then
        XCTAssertEqual(screen.navigationItem.title, viewModel.getTitle())
    }
    
    func testTableViewNumberOfRowsInSection() {
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
            tableView.register(ListNewsCell.self, forCellReuseIdentifier: ListNewsCell.identifier)
            return tableView
        }()
        let index = IndexPath(item: 0, section: 0)
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            screen.tableView(tableView, cellForRowAt: indexPath)
        }
        // When
        let rusult = tableView(table, cellForRowAt: index)
        // Then
        XCTAssertNotNil(rusult)
    }
    
    func testTableViewDidSelectRowAt() {
        // Given
        let table = UITableView()
        let index = IndexPath(item: 0, section: 0)
        func tableView(_ tableView: UITableView, didSelectRowAt: IndexPath) {
            screen.tableView(tableView, didSelectRowAt: didSelectRowAt)
        }
        // When
        tableView(table, didSelectRowAt: index)
        // Then
        XCTAssertEqual(viewModel.index, index)
    }
    
}

final class ListNewsViewModelSpy: ListNewsViewModelDelegat {
    
    var countViewDidLoad = 0
    var index = IndexPath()
    var array: [ListNewsViewModel.Model] = [ListNewsViewModel.Model(name: .emptyLine, image: .emptyLine, data: Date(), id: 1)]
    let title = "Title"
    
    func goToScreenFullNews(model: IndexPath) {
        index = model
    }
    func numberOfRows() -> Int {
        array.count
    }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DemoMVVM.ListNewsViewModel.Model {
        array[indexPath.row]
    }
    func fetchNews(completion: @escaping () -> Void) {
        countViewDidLoad = 1
    }
    func getTitle() -> String {
        title
    }
    
}
