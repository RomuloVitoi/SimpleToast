//
//  ToastView.swift
//  Toast
//
//  Created by Hannes Lohmander on 13/07/15.
//  Copyright (c) 2015 Lohmander. All rights reserved.
//

import Foundation

class ToastView: UIView {
    var blurEffectView: UIVisualEffectView?
    var textLabel: UILabel?
    
    fileprivate var constraintsSet: Bool = false
    
    required init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    fileprivate func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = 0
        
        if Toast.appearance.blur {
            let blurEffect = UIBlurEffect(style: Toast.appearance.blurStyle)
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView?.translatesAutoresizingMaskIntoConstraints = false
            blurEffectView?.layer.cornerRadius = 5
            blurEffectView?.clipsToBounds = true
            
            self.addSubview(blurEffectView!)
        }
        
        textLabel = UILabel()
        textLabel?.textColor = Toast.appearance.textColor
        textLabel?.numberOfLines = 0
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(textLabel!)
    }
    
    override func updateConstraints() {
        if !constraintsSet {
            let padding = Toast.appearance.padding
            
            var views: [String: AnyObject] = ["label": textLabel!]
            
            let horizontalMargin = NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(padding)-[label]-\(padding)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
            let verticalMargin = NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(padding)-[label]-\(padding)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
            
            self.addConstraints(horizontalMargin)
            self.addConstraints(verticalMargin)
            
            if blurEffectView != nil {
                views["blur"] = blurEffectView!
                
                let blurWidthConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|[blur]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
                let blurHeightContraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|[blur]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
                
                self.addConstraints(blurWidthConstraint)
                self.addConstraints(blurHeightContraint)
            }
            
            constraintsSet = true
        }
        
        super.updateConstraints()
    }
}
