//
//  ToastAppearance.swift
//  Toast
//
//  Created by Hannes Lohmander on 13/07/15.
//  Copyright (c) 2015 Lohmander. All rights reserved.
//

import Foundation

open class ToastAppearance {
    /// Whether or not the toast background should have a blurred background
    open var blur: Bool = true
    
    /// Blur style if blur is set to true
    open var blurStyle: UIBlurEffectStyle = .dark
    
    /// Toast background corner radius
    open var cornerRadius: CGFloat = 4
    
    /// Margin between the toast and the surrounding view
    open var margin: CGFloat = 16
    
    /// Padding between the text label and the toast background
    open var padding: CGFloat = 10
    
    /// The label text color
    open var textColor: UIColor = UIColor.white
    
    /// The duration of the fade in animation
    open var animationDuration: TimeInterval = 0.5
}
