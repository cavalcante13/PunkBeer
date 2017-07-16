//
//  UIViewExtension.swift
//  Consorcio
//
//  Created by Diego Cavalcante on 28/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit



extension UIView {
    
    @IBInspectable
    var borderColor : UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth : CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    var cornerRadius : CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            clipsToBounds      = newValue > 0
        }
    }
    
    @IBInspectable
    var clipToBounds : Bool {
        get {
            return self.clipsToBounds
        }
        set {
            self.clipsToBounds = newValue
        }
    }
    
    @IBInspectable
    var isGone : Bool {
        get {
            return isHidden
        }
        set {
            self.alpha    = newValue ? 0.0 : 1.0
            self.isHidden = newValue
        }
    }
}
