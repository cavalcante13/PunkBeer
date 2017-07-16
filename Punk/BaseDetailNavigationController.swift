//
//  BaseDetailNavigationController.swift
//  Punk
//
//  Created by Diego Cavalcante on 04/07/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit

class BaseDetailNavigationController: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor  = #colorLiteral(red: 0.08993787318, green: 0.4998377562, blue: 0.7103896737, alpha: 1)
        navigationBar.tintColor     = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    }
}
