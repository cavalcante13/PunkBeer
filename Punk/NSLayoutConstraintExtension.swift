//
//  NSLayoutContraintExtension.swift
//  Consorcio
//
//  Created by Diego Cavalcante on 25/05/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit


public extension NSLayoutConstraint {
    
    // case iPhone4 serves to iPhone4s
    // case iPhone5 serves to iPhone5c, 5s, SE
    // case iPhone6 serves to iPhone6s, 7
    // case iPhone7Plus serves to iPhone6Plus, iPhone6SPlus
    
     public enum Model : Int {
        case iPhone4
        
        case iPhone5
        
        case iPhone6
        
        case iPhone7Plus
        
        case unknown
    }
    
    @IBInspectable
    var iPhone4: CGFloat  {
        get { return self.constant }
        set {
            self.constant = NSLayoutConstraint.model == .iPhone4 ? newValue : self.constant
        }
    }
    
    @IBInspectable
    var iPhone5: CGFloat  {
        get { return self.constant }
        set {
            self.constant = NSLayoutConstraint.model == .iPhone5 ? newValue : self.constant
        }
    }
    
    @IBInspectable
    var iPhone6: CGFloat  {
        get { return self.constant }
        set {
            self.constant = NSLayoutConstraint.model == .iPhone6 ? newValue : self.constant
        }
    }
    
    @IBInspectable
    var iPhone7Plus: CGFloat  {
        get { return self.constant }
        set {
            self.constant = NSLayoutConstraint.model == .iPhone7Plus ? newValue : self.constant
        }
    }
    
    public static var model : Model {
        get {
            let size = UIScreen.main.bounds.size
            
            switch size {
            case CGSize(width : 320, height : 480):
                return .iPhone4
            case CGSize(width : 320, height : 568):
                return .iPhone5
            case CGSize(width : 375, height : 667):
                return .iPhone6
            case CGSize(width : 414, height : 736):
                return .iPhone7Plus
            default:
                return .unknown
            }
        }
    }
}
