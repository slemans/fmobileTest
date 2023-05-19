//
//  Date+Extension.swift
//  DemoMVVM
//
//  Created by Павел on 19.05.23.
//

import Foundation

// MARK: - Empty string

extension Date {
    
    func string() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy mm:hh"
        return dateFormatter.string(from: self)
    }
    
}
