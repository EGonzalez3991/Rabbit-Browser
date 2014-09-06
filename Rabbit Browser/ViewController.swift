//
//  ViewController.swift
//  Rabbit Browser
//
//  Created by Christopher Gonzalez on 9/5/14.
//  Copyright (c) 2014 gchriswill. All rights reserved.
//

// IMPORTANT NOTE! You are working in the Master branch!

import UIKit

class ViewController: UIViewController {
    
    var RBRabbitLogin: UIImageView = UIImageView()
    var RBRabbitLogin1: UIImageView = UIImageView()
    var RBRabbitLogin2: UIImageView = UIImageView()
    var RBRabbitLogin3: UIImageView = UIImageView()
    var RBRabbitLogin4: UIImageView = UIImageView()
    var RBRabbitLogin5: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        RBRabbitLogin.frame = CGRectMake(0, 0, 200, 200)
        RBRabbitLogin.layer.cornerRadius = 100
        RBRabbitLogin.backgroundColor = UIColor.orangeColor()
        RBRabbitLogin.image = UIImage(named: "RBArbyIcon")
        RBRabbitLogin.center = self.view.center
        
        
        RBRabbitLogin1.frame = CGRectMake(0, 0, 150, 150)
        RBRabbitLogin1.layer.cornerRadius = 75
        RBRabbitLogin1.backgroundColor = UIColor.yellowColor()
        RBRabbitLogin1.image = UIImage(named: "RBUserSettings")
        RBRabbitLogin1.center = self.view.center
        
        
        RBRabbitLogin2.frame = CGRectMake(0, 0, 100, 100)
        RBRabbitLogin2.layer.cornerRadius = 50
        RBRabbitLogin2.backgroundColor = UIColor.redColor()
        RBRabbitLogin2.image = UIImage(named: "RBUserProfile")
        RBRabbitLogin2.center = self.view.center
        
        
        RBRabbitLogin3.frame = CGRectMake(0, 0, 100, 100)
        RBRabbitLogin3.layer.cornerRadius = 50
        RBRabbitLogin3.backgroundColor = UIColor.greenColor()
        RBRabbitLogin3.image = UIImage(named: "RBUserProfile")
        RBRabbitLogin3.center = self.view.center
        
        
        RBRabbitLogin4.frame = CGRectMake(0, 0, 100, 100)
        RBRabbitLogin4.layer.cornerRadius = 50
        RBRabbitLogin4.backgroundColor = UIColor.purpleColor()
        RBRabbitLogin4.image = UIImage(named: "RBUserProfile")
        RBRabbitLogin4.center = self.view.center
        
        
        RBRabbitLogin5.frame = CGRectMake(0, 0, 100, 100)
        RBRabbitLogin5.layer.cornerRadius = 50
        RBRabbitLogin5.backgroundColor = UIColor.blueColor()
        RBRabbitLogin5.image = UIImage(named: "RBUserProfile")
        RBRabbitLogin5.center = self.view.center
        

        
        
//        UIView.animateWithDuration(
//            1,
//            delay: 2,
//            usingSpringWithDamping: 0.5,
//            initialSpringVelocity: 10,
//            options: UIViewAnimationOptions.BeginFromCurrentState,
//            animations: { () -> Void in
//                
//                self.RBRabbitLogin1.center = CGPointMake(self.view.center.x, self.view.center.y - 250)
//                self.RBRabbitLogin2.center = CGPointMake(self.view.center.x - 200, self.view.center.y - 100)
//                self.RBRabbitLogin3.center = CGPointMake(self.view.center.x + 200, self.view.center.y - 100)
//                self.RBRabbitLogin4.center = CGPointMake(self.view.center.x - 150, self.view.center.y + 150)
//                self.RBRabbitLogin5.center = CGPointMake(self.view.center.x + 150, self.view.center.y + 150)
//                
//                
//            }, completion: { (Bool) -> Void in
//                
//            })
        
        self.view.addSubview(RBRabbitLogin1)
        self.view.addSubview(RBRabbitLogin2)
        self.view.addSubview(RBRabbitLogin3)
        self.view.addSubview(RBRabbitLogin4)
        self.view.addSubview(RBRabbitLogin5)
        self.view.addSubview(RBRabbitLogin)
        
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        
        
        //RBRabbitLogin1.center = CGPointMake(self.view.center.x, self.view.center.y - 250)
        //RBRabbitLogin2.center = CGPointMake(self.view.center.x - 200, self.view.center.y - 100)
        //RBRabbitLogin3.center = CGPointMake(self.view.center.x + 200, self.view.center.y - 100)
        //RBRabbitLogin4.center = CGPointMake(self.view.center.x - 150, self.view.center.y + 150)
        //RBRabbitLogin5.center = CGPointMake(self.view.center.x + 150, self.view.center.y + 150)
        RBRabbitLogin.center = self.view.center
        RBRabbitLogin1.center = self.view.center
        RBRabbitLogin2.center = self.view.center
        RBRabbitLogin3.center = self.view.center
        RBRabbitLogin4.center = self.view.center
        RBRabbitLogin5.center = self.view.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

