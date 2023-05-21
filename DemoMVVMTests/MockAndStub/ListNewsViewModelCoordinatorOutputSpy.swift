//
//  ListNewsViewModelCoordinatorOutputSpy.swift
//  DemoMVVMTests
//
//  Created by Павел on 21.05.23.
//

import XCTest
@testable import DemoMVVM

final class ListNewsViewModelCoordinatorOutputSpy: ListNewsViewModelCoordinatorOutput {

    var count: Int?
    func goToFullNews(_ news: DemoMVVM.ListNews?) {
        count = 1
    }

}
