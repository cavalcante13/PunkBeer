//
//  BaseNavigationController.swift
//  Punk
//
//  Created by Diego Cavalcante on 27/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor  = #colorLiteral(red: 0.01960784314, green: 0.2784313725, blue: 0.4078431373, alpha: 1)
        navigationBar.tintColor     = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
