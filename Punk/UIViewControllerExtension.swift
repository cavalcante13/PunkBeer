//
//  UIViewControllerExtension.swift
//  Gits
//
//  Created by Diego Cavalcante on 28/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    typealias Action = ()-> Void
    
    func confirmAlert(title : String? = nil, description : String? = nil, action : Action? = nil) {
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        
        let confirmButton = UIAlertAction(title: "Ok", style: .default) { _ in
            action?()
        }
        
        alertController.addAction(confirmButton)
        present(alertController, animated: true, completion: nil)
    }
}
