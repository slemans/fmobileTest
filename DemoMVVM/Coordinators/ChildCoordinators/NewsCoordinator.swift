//
//  NewsViewModelCoordinatorDelegate.swift
//  shopDemo
//
//  Created by Павел on 17.05.23.
//

import UIKit

protocol NewsViewModelOutput: AnyObject { }

final class NewsCoordinator: Coordinator {

    // MARK: - Properties

    private var news: ListNews?
    private var screen: UIViewController?
    
    init(news: ListNews?) {
        self.news = news
    }
    
    func start() {
        let newsVc = NewsVC()
        let viewModel = NewsViewModel(model: news)
        newsVc.viewModel = viewModel
        screen = newsVc
    }
    
    func makeScreen() -> UIViewController {
        guard let screen = screen else { return UIViewController() }
        
        return screen
    }

}
