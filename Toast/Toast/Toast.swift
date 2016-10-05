//
//  Toast.swift
//  Toast
//
//  Created by Hannes Lohmander on 13/07/15.
//  Copyright (c) 2015 Lohmander. All rights reserved.
//

import Foundation

open class Toast {
    open static let LENGTH_SHORT: Double = 2
    open static let LENGTH_LONG: Double = 5
    
    /// Shared toast appearance settings
    open static let appearance = ToastAppearance()
    
    /// Shared keyboard observer used to determine appropriate toast position
    fileprivate static var keyboardObserver: KeyboardObserver?
    
    var text: String!
    var duration: Double!
    var toast: ToastView!
    
    /**
        Initializes keyboard observer used to figure out the appropriate
        toast position 
    
        :returns: Void
    */
    open class func initKeyboardObserver() -> Void {
        Toast.keyboardObserver = KeyboardObserver()
    }
    
    /**
        Initializes a Toast-object with sepcified text and duration
    
        :param: text Text message to show
        :param: duration Time to show the toast
        
        :returns: Toast
    */
    open class func makeText(_ text: String, duration: Double = Toast.LENGTH_LONG) -> Toast {
        let toast = Toast()
        
        toast.text = text
        toast.duration = duration
        
        return toast
    }
    
    /**
        Displays the toast on screen
    
        :returns: Void
    */
    open func show() -> Void {
        let keyWindow = UIApplication.shared.keyWindow
        
        if let windowView = keyWindow?.subviews.first as UIView? {
            toast = ToastView()
            toast.textLabel?.text = self.text
            
            let margin = Toast.appearance.margin
            let views = ["toast": toast]
            let yMargin: CGFloat
            
            if let kO = Toast.keyboardObserver {
                yMargin = margin + kO.offset
            } else {
                yMargin = margin
            }
            
            windowView.addSubview(toast)
            
            let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[toast]-\(yMargin)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
            let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(>=\(margin))-[toast]-(>=\(margin))-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
            let centerContraint = NSLayoutConstraint(item: toast, attribute: .centerX, relatedBy: .equal, toItem: windowView, attribute: .centerX, multiplier: 1, constant: 0)
            
            windowView.addConstraints(verticalConstraints)
            windowView.addConstraints(horizontalConstraints)
            windowView.addConstraint(centerContraint)

            UIView.animate(withDuration: Toast.appearance.animationDuration, animations: { () -> Void in
                self.toast.alpha = 1
            })
            
            delayHide(duration)
        }
    }
    
    /**
        Hide the toast
    
        :returns: Void
    */
    open func hide() -> Void {
        UIView.animate(withDuration: Toast.appearance.animationDuration, animations: { () -> Void in
            self.toast.alpha = 0
        }, completion: { (_) -> Void in
            self.remove()
        }) 
    }
    
    /**
        Hide the toast after x seconds
    
        :param: delay Number of seconds to wait before hiding
    
        :returns: Void
    */
    open func delayHide(_ delay: Double) -> Void {
        let delayTime = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.hide()
        }
    }
    
    /**
        Remove the toast from the view tree (automatically called by
        hide after animation has finished)
    
        :returns: Void
    */
    open func remove() -> Void {
        self.toast.removeFromSuperview()
    }
}
