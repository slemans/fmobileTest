//
//  String+Extension.swift
//  shopDemo
//
//  Created by Павел on 17.03.23.
//

import Foundation

// MARK: - Empty string

extension String {
    
    static let emptyLine: String = ""
    
    func makeDate() -> Date {
        guard let number = Int(self) else { return Date() }

        let time = TimeInterval(number / 1000)
        return Date(timeIntervalSince1970: time)
    }
    
}
