//
//  RBOptionsViewController.swift
//  Rabbit Browser
//
//  Created by Christopher Gonzalez on 9/13/14.
//  Copyright (c) 2014 gchriswill. All rights reserved.
//

import UIKit

class RBOptionsViewController: UIViewController {
    
    
    
    // UI Outlets
    @IBOutlet weak var testingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testingLabel.text = "Changed. Son."
        
        
    }// @end of ViewDidLoad
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.superview?.layer.cornerRadius = 50
        self.view.superview?.layer.masksToBounds = true
        
    }// @end of viewWillLayoutSubviews

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }// @end of didReceiveMemoryWarning
    
    
}

