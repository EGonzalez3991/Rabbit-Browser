//
//  RBDashboardViewController.swift
//  Rabbit Browser
//
//  Created by Christopher Gonzalez on 9/15/14.
//  Copyright (c) 2014 gchriswill. All rights reserved.
//

import UIKit

class RBDashboardViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var testingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testingLabel.text = "hello"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
}