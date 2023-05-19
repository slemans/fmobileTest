//
//  ListNewsViewModelTests.swift
//  DemoMVVMTests
//
//  Created by Павел on 18.05.23.
//

import XCTest
@testable import DemoMVVM

final class ListNewsViewModelTests: XCTestCase {

    private var viewModel: ListNewsViewModel!
    private var output: ListNewsViewModelCoordinatorOutputSpy!
    private var servise: NewsServiceProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.output = ListNewsViewModelCoordinatorOutputSpy()
        self.servise = NewsServiceProtocolSpy()
        self.viewModel = ListNewsViewModel(output: output, servise: servise)
    }

    override func tearDownWithError() throws {
        output = nil
        servise = nil
        viewModel = nil
        try super.tearDownWithError()
    }

    func testGetTitle() {
        // Given
        func getTitle() -> String {
            viewModel.getTitle()
        }
        // When
        let result = getTitle()
        // Then
        XCTAssertNotNil(result)
    }
    func testGoToScreenFullNews() {
        // Given
        let index = IndexPath(item: 0, section: 0)
        func goToScreenFullNews(model: IndexPath) {
            viewModel.goToScreenFullNews(model: model)
        }
        // When
        goToScreenFullNews(model: index)
        // Then
        XCTAssertNotNil(output.count)
    }
    func testFetchNews() {
        // Given
        var resultWork: Bool = false
        viewModel.fetchNews {
            resultWork = true
        }
        // Then
        XCTAssert(resultWork)
    }
    func testReturnSortArray() {
        // Given
        let model = [ListNews]()
        let result = viewModel.returnSortArray(model)
        // Then
        XCTAssertNotNil(result)
    }

    func testNumberOfRows() {
        // Given
        let result = viewModel.numberOfRows()
        // Then
        XCTAssertEqual(result, 0)
    }

}

final class ListNewsViewModelCoordinatorOutputSpy: ListNewsViewModelCoordinatorOutput {

    var count: Int?
    func goToFullNews(_ news: DemoMVVM.ListNews?) {
        count = 1
    }

}
final class NewsServiceProtocolSpy: NewsServiceProtocol {
    
    func fetchImage(url: String, completion: @escaping CompletionHandler<UIImage?>) {
        let image = UIImage()
        completion(.success(image))
    }
    

    func getNews(completion: @escaping CompletionHandler<[DemoMVVM.ListNews]>) {
        let array = [ListNews(
            title: "Demo",
            description: "Demo",
            imageURL: "http://dummyimage.com/156x100.png/5fa2dd/ffffff",
            id: 1,
            createAt: "1647249381000"
        )]
        completion(.success(array))
    }

}
