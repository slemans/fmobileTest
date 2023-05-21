//
//  NewsViewModel.swift
//  shopDemo
//
//  Created by Павел on 17.05.23.
//

import Foundation

protocol NewsViewModelInput {
    
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> NewsViewModel.Model
    func getTitlePage() -> String
    
}

final class NewsViewModel {

    private var array: [Model] = []
    private let model: ListNews?

    // MARK: - Initialization

    init(model: ListNews?) {
        self.model = model
        makeArrayModel()
    }

}

extension NewsViewModel: NewsViewModelInput {
    
    func getTitlePage() -> String {
        guard let title = model?.date.string() else { return .emptyLine}
        return title
    }
    func numberOfRows() -> Int {
        array.count
    }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> Model {
        array[indexPath.row]
    }
    
}

private extension NewsViewModel {
    
    func makeArrayModel() {
        guard let model = model else { return }
        
        array.append(Model.image(model.imageURL))
        array.append(Model.decription(model.description))
    }
    
}

// MARK: - Entiete

extension NewsViewModel {
    
    enum Model {
        case image(String)
        case decription(String)
    }
    
}
