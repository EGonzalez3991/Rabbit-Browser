//
//  RBDashboardViewController.swift
//  Rabbit Browser
//
//  Created by Christopher Gonzalez on 9/15/14.
//  Copyright (c) 2014 gchriswill. All rights reserved.
//

import UIKit

class RBDashboardViewController: UIViewController, UITextFieldDelegate {
    
    // This ViewController is segued from RBAccountHelper (Line 256)
    
    // UI Outlets
    //@IBOutlet weak var testingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //testingLabel.text = "#RabbitBrowser"
        
        
    }// @end of ViewDidLoad
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // This crops the master views corners and masks it to bounds
        // We want to access the master view when cropping so avoid the "gray corner bug"
        
        self.view.superview?.layer.cornerRadius = 50
       self.view.superview?.layer.masksToBounds = true
        
    }// @end of viewWillLayoutSubviews
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }// @end of didReceiveMemoryWarning
    
}