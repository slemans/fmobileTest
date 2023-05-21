//
//  ViewDecorator+UILabel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

extension ViewDecorator where View: UILabel {
    
    static func alignment(_ alignment: NSTextAlignment) -> ViewDecorator<View> {
        ViewDecorator {
            $0.textAlignment = alignment
        }
    }

    static func linesLimit(_ limit: Int) -> ViewDecorator<View> {
        ViewDecorator {
            $0.numberOfLines = limit
        }
    }

    static var multiline: ViewDecorator<View> {
        ViewDecorator {
            $0.decorated(with: .linesLimit(0))
        }
    }

    static func text(_ text: String) -> ViewDecorator<View> {
        ViewDecorator {
            $0.text = text
        }
    }

    static func font(_ font: UIFont, adjustsFontSizeToFitWidth: Bool = false) -> ViewDecorator<View> {
        ViewDecorator {
            $0.font = font
            $0.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        }
    }

}
