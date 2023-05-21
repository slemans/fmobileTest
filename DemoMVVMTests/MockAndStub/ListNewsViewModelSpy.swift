//
//  ListNewsViewModelSpy.swift
//  DemoMVVMTests
//
//  Created by Павел on 21.05.23.
//

import XCTest
@testable import DemoMVVM

final class ListNewsViewModelSpy: ListNewsViewModelInput {
    
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
