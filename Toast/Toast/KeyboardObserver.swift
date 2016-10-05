//
//  KeyboardObserver.swift
//  Toast
//
//  Created by Hannes Lohmander on 13/07/15.
//  Copyright (c) 2015 Lohmander. All rights reserved.
//

import Foundation

class KeyboardObserver: NSObject {
    var offset: CGFloat = 0
    
    required override init() {
        super.init()
        
        let nc = NotificationCenter.default
        
        nc.addObserver(self, selector: #selector(KeyboardObserver.keyboardDidAppear(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        nc.addObserver(self, selector: #selector(KeyboardObserver.keyboardDidDisappear(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    func keyboardDidAppear(_ notification: Notification) -> Void {
        let info = (notification as NSNotification).userInfo
        let keyboardFrame = info?[UIKeyboardFrameBeginUserInfoKey] as? NSValue
        let keyboardSize = keyboardFrame?.cgRectValue.size
        
        if let kS = keyboardSize {
            offset = kS.height
        }
    }
    
    func keyboardDidDisappear(_ notification: Notification) -> Void {
        offset = 0
    }
}
