//
//  ListNewsViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.05.23.
//

import Foundation

protocol ListNewsViewModelInput {
    
    func goToScreenFullNews(model: IndexPath)
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> ListNewsViewModel.Model
    func fetchNews(completion: @escaping () -> Void)
    func getTitle() -> String
    
}

final class ListNewsViewModel {

    private weak var output: ListNewsViewModelCoordinatorOutput?
    private let servise: NewsServiceProtocol

    private var arrayFetchNews: [Model] = []
    private var arrayStartNews: [ListNews] = []

    // MARK: - Initialization

    init(output: ListNewsViewModelCoordinatorOutput,
        servise: NewsServiceProtocol) {
        self.output = output
        self.servise = servise
    }

}

extension ListNewsViewModel: ListNewsViewModelInput {
    
    func getTitle() -> String {
        Constants.titlePage
    }
    func goToScreenFullNews(model: IndexPath) {
        let news = arrayStartNews.filter { $0.id == arrayFetchNews[model.row].id }.first
        output?.goToFullNews(news)
    }
    func fetchNews(completion: @escaping () -> Void) {
        servise.getNews { [weak self] result in
            switch result {
            case .success(let news):
                self?.arrayFetchNews = self?.returnSortArray(news) ?? [Model]()
                completion()
            case .failure:
                break
            }
        }
    }
    func returnSortArray(_ news: [ListNews]) -> [Model] {
        arrayStartNews = news
        return news.compactMap {
            Model(
                name: $0.title,
                image: $0.imageURL,
                data: $0.date,
                id: $0.id
            )
        }
        .sorted { $0.data > $1.data }
    }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> Model {
        arrayFetchNews[indexPath.row]
    }
    func numberOfRows() -> Int {
        arrayFetchNews.count
    }

}

// MARK: - Constants

private extension ListNewsViewModel {
    
    enum Constants {
        static let titlePage = "All news"
    }
    
}

// MARK: - Entiete

extension ListNewsViewModel {
    
    struct Model {
        let name: String
        let image: String
        let data: Date
        let id: Int
    }
    
}
