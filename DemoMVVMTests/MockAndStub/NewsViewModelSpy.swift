//
//  NewsViewModelSpy.swift
//  DemoMVVMTests
//
//  Created by Павел on 21.05.23.
//

import XCTest
@testable import DemoMVVM

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
