//
//  TestViewController.swift
//  Punk
//
//  Created by Diego Cavalcante on 04/07/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(TestViewController.close))
        navigationItem.setRightBarButton(item, animated: true)
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backHomeAction(_ sender: Any) {
        jump(to: BeerViewController())
    }
    
    deinit {
        print("TestViewController deinit")
    }
    
    func jump(to viewController : UIViewController) {
        (UIApplication.shared.delegate as! AppDelegate).presentBeer()
        
//        guard let root = UIApplication.shared.keyWindow?.rootViewController else {
//            return
//        }
//    
//        for childViewController in root.childViewControllers {
//            if childViewController.parent is UINavigationController {
//                print("NavigationController")
//            }else {
//                print("Controller")
//            }
//        }
    }
}
