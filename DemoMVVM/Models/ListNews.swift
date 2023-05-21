//
//  ListNews.swift
//  shopDemo
//
//  Created by Павел on 27.03.23.
//

import Foundation

struct ListNews {
    
    // MARK: Variables
    
    let title: String
    let description: String
    let imageURL: String
    let id: Int
    var date: Date {
        createAt.makeDate()
    }
    
    // MARK: Private
    
    private let createAt: String
    
    init(title: String, description: String, imageURL: String, id: Int, createAt: String) {
        self.title = title
        self.description = description
        self.imageURL = imageURL
        self.id = id
        self.createAt = createAt
    }
    
}

extension ListNews: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id, title, description
        case imageURL = "image_url"
        case createAt = "create_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)
        self.createAt = try container.decode(String.self, forKey: .createAt)
    }
}
