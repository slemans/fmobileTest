//
//  URL+Extension.swift
//  shopDemo
//
//  Created by Павел on 27.03.23.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self = URL(string: value) ?? URL.defaultURL
    }
    
    public static var defaultURL: URL = NSURL() as URL
    
}

