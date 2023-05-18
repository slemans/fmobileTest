//
//  UIFont+Fonts.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

extension UIFont {
    
    static let sf: (DesignSystemFont) -> UIFont = {
        makeFont(using: $0)
    }
    
}

// MARK: - Font styles

extension UIFont {
    
    enum DesignSystemFont {
        case body(Inscriptions? = nil)
        
        var fontType: Type {
            let size: CGFloat
            let inscriptions: Inscriptions?
            
            switch self {
            case .body(let lettering):
                size = 17
                inscriptions = lettering
            }
            
            return (size: size, weight: inscriptions?.weight ?? .regular)
        }
        
    }
    
}

// MARK: - Entities

extension UIFont {
    
    enum Inscription {
        case bold, semibold, italic
    }
    
    typealias Inscriptions = [Inscription]
    
    typealias `Type` = (size: CGFloat, weight: Weight)
    
}

// MARK: - Inscriptions

extension UIFont.Inscriptions {
    
    var weight: UIFont.Weight {
        if contains(.bold) {
            return .bold
        } else if contains(.semibold) {
            return .semibold
        } else {
            return .regular
        }
    }
    
}

// MARK: - Private functions

private extension UIFont {
    
//    static func makeFont(using style: DesignSystemFont) -> UIFont {
//        switch style {
//        case .body(let inscriptions):
//
//            let fontType = style.fontType
//
//            var font: UIFont?
//            switch style.fontType.weight {
//            case .bold:
//                font = UIFont(name: "Montserrat-Bold", size: fontType.size)
//            case .semibold:
//                font = UIFont(name: "Montserrat-SemiBold", size: fontType.size)
//            default:
//                font = UIFont(name: "Montserrat", size: fontType.size)
//            }
//
//            guard let font else { return .systemFont(ofSize: fontType.size, weight: fontType.weight)}
//
//            return inscriptions?.contains(.italic) ?? false
//            ? font.bold
//                : font
//        }
//    }
    
    static func makeFont(using style: DesignSystemFont) -> UIFont {
        switch style {
        case .body(let inscriptions):
            
            let fontType = style.fontType
            let font: UIFont = .systemFont(ofSize: fontType.size, weight: fontType.weight)
            
            return inscriptions?.contains(.italic) ?? false
                ? font.italic
                : font
        }
    }
    
}
