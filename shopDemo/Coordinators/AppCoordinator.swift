//
//  AppCoordinator.swift
//  shopDemo
//
//  Created by Павел on 28.03.23.
//

import UIKit

class AppCoordinator: Coordinator {

    // MARK: - Properties
    var window: UIWindow
    var coordinators = [String: Coordinator]()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        showListsNewsPage()
    }
}

extension AppCoordinator: ListNewsCoordinatorOutput {
    
    func showListsNewsPage() {
        let listNewsCoordinator = ListNewsCoordinator(window: window)
        coordinators["ListsNews"] = listNewsCoordinator
        listNewsCoordinator.delegate = self
        listNewsCoordinator.start()
    }
    
}
