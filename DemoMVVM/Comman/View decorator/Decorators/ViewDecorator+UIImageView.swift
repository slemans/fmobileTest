//
//  ViewDecorator+UIImageView.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

extension ViewDecorator where View: UIImageView {
    
    static func image(_ image: UIImage?) -> ViewDecorator<View> {
        ViewDecorator {
            $0.image = image
        }
    }
    
}
