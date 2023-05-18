//
//  UIFont+Extension.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

extension UIFont {
    
    var italic: Self {
        withTraits(.traitItalic)
    }
    
    var bold: Self {
        withTraits(.traitBold)
    }

    func withTraits(_ traits: UIFontDescriptor.SymbolicTraits) -> Self {
        guard let descriptor = fontDescriptor.withSymbolicTraits(traits) else {
            return self
        }

        return Self(descriptor: descriptor, size: pointSize)
    }

}
