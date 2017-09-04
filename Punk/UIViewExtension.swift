//
//  UIViewExtension.swift
//  Consorcio
//
//  Created by Diego Cavalcante on 26/05/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit


extension UIView {
    
    /*
     @Diego Cavalcante Costa
     - In order to create computed properties for extensions, we need a key to
     store and access the stored property
     */
    fileprivate struct AssociatedObjectKeys {
        static var tapGesture : UInt8 = 0
    }
    
    fileprivate typealias Action = ()-> Swift.Void?
    fileprivate typealias ActionView = (UIView?)-> Swift.Void?
    /*
     @Diego Cavalcante Costa
     - Set our computed property type to a closure
     */
    fileprivate var tapGestureRecognizerAction : Action? {
        get { return objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGesture) as? Action }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGesture, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
   
    fileprivate var tapGestureRecognizerActionView : ActionView? {
        get { return objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGesture) as? ActionView }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGesture, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    /*
     @Diego Cavalcante Costa
     - Here we create the tap gesture recognizer and
     store the closure the user passed to us in the associated object we declared above
     */
    public func addAction(action : @escaping ()-> Swift.Void?) {
        isUserInteractionEnabled    = true
        tapGestureRecognizerAction  = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapAction(sender:)))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    public func addAction(actionView : @escaping (UIView?)->Swift.Void) {
        isUserInteractionEnabled    = true
        tapGestureRecognizerActionView  = actionView
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapAction(sender:)))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    /*
     @Diego Cavalcante Costa
     - Every time the user taps on the UIView, this function gets called,
     which triggers the closure we stored
     */
    @objc fileprivate func handleTapAction(sender : UITapGestureRecognizer) {
        if let action = tapGestureRecognizerAction {
            action()
        }
        if let actionView = tapGestureRecognizerActionView {
            actionView(sender.view)
        }
    }
}
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
    
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * .pi
        let rotation = transform.rotated(by: radians);
        self.transform = rotation
    }
}
