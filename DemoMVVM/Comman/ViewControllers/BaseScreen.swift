//
//  BaseScreen.swift
//  DemoMVVM
//
//  Created by Павел on 19.05.23.
//

import UIKit

class BaseScreen: UIViewController {
    
    
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
}

// MARK: - Private functions

private extension BaseScreen {
    
    func setupView() {
        view.backgroundColor = .white
    }
    
}
