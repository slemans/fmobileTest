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

    private var output: NewsViewModelOutput?
    private var array: [Model] = []
    private let model: ListNews?

    // MARK: - Initialization

    init(output: NewsViewModelOutput, model: ListNews?) {
        self.output = output
        self.model = model
        makeArrayModel()
    }

}

extension NewsViewModel: NewsViewModelInput {
    
    func getTitlePage() -> String {
        makeDate()
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
    
    func makeDate() -> String {
        guard let title = model?.date else { return .emptyLine }
        
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy mm:hh"
        return df.string(from: title)
    }
    
}

// MARK: - Entiete

extension NewsViewModel {
    
    enum Model {
        case image(String)
        case decription(String)
    }
    
}
