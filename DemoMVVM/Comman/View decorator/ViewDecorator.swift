//
//  ViewDecorator.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

struct ViewDecorator<View: UIView> {
    
    // MARK: - Public
    
    // MARK: Variables
    
    let decoration: (View) -> Void
    
    // MARK: Functions
    
    func decorate(_ view: View) {
        decoration(view)
    }
    
}
