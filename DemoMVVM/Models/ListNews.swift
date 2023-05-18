//
//  ListNews.swift
//  shopDemo
//
//  Created by Павел on 27.03.23.
//

import Foundation

struct ListNews: Codable {
    
    // MARK: Variables
    
    let title: String
    let description: String
    let imageURL: String
    let id: Int
    var date: Date {
        makeDate(createAt)
    }
    
    // MARK: Private
    
    private let createAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, description
        case imageURL = "image_url"
        case createAt = "create_at"
    }
}

private extension ListNews {
    
    func makeDate(_ createAt: String) -> Date {
        guard let number = Int(createAt) else { return Date() }

        let time = TimeInterval(number / 1000)
        return Date(timeIntervalSince1970: time)
    }
    
}
