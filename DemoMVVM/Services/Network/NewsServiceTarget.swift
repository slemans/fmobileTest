//
//  ShopThingsTarget.swift
//  shopDemo
//
//  Created by Павел on 27.03.23.
//

import UIKit
import Moya

enum NewsServiceTarget {
    case getNews
    case getImage(url: String)
}

extension NewsServiceTarget: TargetType {
    
    var baseURL: URL {
        switch self {
        case .getImage(let url):
            return URL(stringLiteral: url)
        default:
            return URL(stringLiteral: "https://raw.githubusercontent.com/")
        }
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "Lavrenkov/fake_data/main/news_mock.json"
        default:
            return .emptyLine
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return .none
        }
    }
    
    
}
