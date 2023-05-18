//
//  DecoratableView.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

protocol DecoratableView: UIView {}

extension DecoratableView {
    
    init(decorator: ViewDecorator<Self>) {
        self.init(frame: .zero)
        
        decorate(with: decorator)
    }

    @discardableResult
    func decorated(with decorator: ViewDecorator<Self>) -> Self {
        decorate(with: decorator)
        
        return self
    }

    func decorate(with decorator: ViewDecorator<Self>) {
        decorator.decorate(self)
        
        currentDecorators.append(decorator)
    }
            
    func redecorate() {
        currentDecorators.forEach {
            $0.decorate(self)
        }
    }
    
}

private extension DecoratableView {
    
    var currentDecorators: [ViewDecorator<Self>] {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.decorator) as? [ViewDecorator<Self>] ?? [ViewDecorator<Self>]()
        }
        
        set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.decorator,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }

}

private struct AssociatedKeys {
    static var decorator = "AssociatedKeys.decorator"
}

extension UIView: DecoratableView {}
