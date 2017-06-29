//
//  AppStyle.swift
//  Gits
//
//  Created by Diego Cavalcante on 28/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import Foundation
import SVProgressHUD

class AppStyle : NSObject {

    class func startActivityIndicator() {
        SVProgressHUD.setBackgroundColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        SVProgressHUD.setForegroundColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8971264983))
        SVProgressHUD.show()
    }
    
    class func stopActivityIndicator() {
        SVProgressHUD.dismiss()
    }
}
