//
//  ViewController.swift
//  Example
//
//  Created by Hannes Lohmander on 13/07/15.
//  Copyright (c) 2015 Lohmander. All rights reserved.
//

import UIKit
import Toast

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showDark(_ sender: AnyObject) {
        Toast.appearance.blurStyle = .dark
        Toast.appearance.textColor = UIColor.white
        
        Toast.makeText(textField.text!, duration: Toast.LENGTH_SHORT).show()
    }
    
    @IBAction func showLight(_ sender: AnyObject) {
        Toast.appearance.blurStyle = .extraLight
        Toast.appearance.textColor = UIColor.darkGray
        
        Toast.makeText(textField.text!, duration: Toast.LENGTH_SHORT).show()
    }
}

