//
//  ListNewsCoordinator.swift
//  shopDemo
//
//  Created by Павел on 16.05.23.
//

import UIKit

protocol ListNewsCoordinatorOutput: AnyObject {}
protocol ListNewsViewModelCoordinatorOutput: AnyObject {
    func goToFullNews(_ news: ListNews?)
}

final class ListNewsCoordinator: Coordinator {

    // MARK: - Properties
    
    weak var delegate: ListNewsCoordinatorOutput?
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let listNewsVc = ListNewsVC()
        let viewModel = ListNewsViewModel(
            output: self,
            servise: NewsService.shared
        )
        listNewsVc.viewModel = viewModel
        window.rootViewController = UINavigationController(rootViewController: listNewsVc)
    }
        
}

extension ListNewsCoordinator: ListNewsViewModelCoordinatorOutput {
    
    func goToFullNews(_ news: ListNews?) {
        guard let navigationController = window.rootViewController as? UINavigationController else { return }
        
        let newsCoordinator = NewsCoordinator(news: news)
        newsCoordinator.start()
        let screen = newsCoordinator.makeScreen()
        navigationController.pushViewController(screen, animated: true)
    }

}
