//
//  RBAccountHelper.swift
//  Rabbit Browser
//
//  Created by Christopher Gonzalez on 9/8/14.
//  Copyright (c) 2014 gchriswill. All rights reserved.
//

import UIKit

  // Custom Functions Extention
 // All custom functions must be implemented here
// This file extention is for transfering all the code that is not native from the RBAccountViewController Class...
extension RBAccountViewController {
    
    func loginAnimation () -> (Void) {
        
        UIView.animateWithDuration(
            0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 10,
            options: UIViewAnimationOptions.AllowAnimatedContent,
            animations: { () -> Void in
                
                self.valuesForLoginAnimation1()
                
            }, completion: { (Bool) -> Void in
                
                UIView.animateWithDuration(
                    1,
                    delay: 0,
                    usingSpringWithDamping: 0.5,
                    initialSpringVelocity: 5,
                    options: UIViewAnimationOptions.BeginFromCurrentState,
                    animations: { () -> Void in
                        
                        self.valuesForLoginAnimation2()
                        
                    }, completion: { (Bool) -> Void in
                        
                        
                        
                    })
                
            })
        
    }// @end of loginAnimation Function
    
    // Needs Comment Description
    func valuesForLoginAnimation1 () -> (Void) {
        
        self.RBLoginImageViews[0].center = self.view.center
        
        self.RBLoginImageViews[3].center = CGPointMake(self.view.center.x, self.view.center.y - 50)
        self.RBLoginImageViews[1].center = CGPointMake(self.view.center.x - 100, self.view.center.y - 125)
        self.RBLoginImageViews[5].center = CGPointMake(self.view.center.x + 100, self.view.center.y - 50)
        self.RBLoginImageViews[2].center = CGPointMake(self.view.center.x - 75, self.view.center.y + 75)
        self.RBLoginImageViews[4].center = CGPointMake(self.view.center.x + 75, self.view.center.y + 75)
        
    }// @end of valuesForLoginAnimation1 Function
    
    // Needs Comment Description
    func valuesForLoginAnimation2 () -> (Void) {
        
        self.RBLoginImageViews[0].center = self.view.center
        
        self.RBLoginImageViews[1].center = CGPointMake(self.view.center.x, self.view.center.y - 250)
        self.RBLoginImageViews[2].center = CGPointMake(self.view.center.x - 200, self.view.center.y - 100)
        self.RBLoginImageViews[3].center = CGPointMake(self.view.center.x + 200, self.view.center.y - 100)
        self.RBLoginImageViews[4].center = CGPointMake(self.view.center.x - 150, self.view.center.y + 150)
        self.RBLoginImageViews[5].center = CGPointMake(self.view.center.x + 150, self.view.center.y + 150)
        
    }// @end of valuesForLoginAnimation2 Function
    
    // Needs Comment Description
    func centerist () -> (Void) {
        
        for (var i = 0; i < 6; i++){
            
            RBLoginImageViews[i].center = self.view.center
            
        }
        
    }// @end of centerist Function
    
    // Needs Comment Description
    func KeyboardUp (toSubstrack: CGFloat) -> (Void) {
        
        for (var i = 0; i < 6; i++){
            
            RBLoginImageViews[i].center = CGPointMake(self.view.center.x, self.view.center.y - toSubstrack)
            
        }
        
    }// @end of KeyboardUp Function
    
    // Needs Comment Description
    func watchShowKeyboard( notification: NSNotification ) {
        
        if !KBCheck {
            
            let NInfo: NSDictionary = notification.userInfo!
            NInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.getValue(&keyboardFrame)
            
            KeyboardUp(keyboardFrame.size.height)
            
            
            self.LoginButtonConstrainBottomSpacing.constant = 20 + self.keyboardFrame.size.height
            self.SegmentedControlConstrainTopSpacing.constant = 180 - self.keyboardFrame.size.height
            self.CreateAccountButtonConstrainBottomSpacing.constant = 20 + self.keyboardFrame.size.height
            
            self.view.updateConstraints()
            self.view.layoutIfNeeded()
            
            self.KBCheck = true
            
        }
        
    }// @end of watchShowKeyboard Function
    
    // Needs Comment Description
    func watchHideKeyboard( notification: NSNotification ) {
        
        if KBCheck {
            
            let NInfo: NSDictionary = notification.userInfo!
            NInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.getValue(&keyboardFrame)
            
            KeyboardUp(0)
            
            self.LoginButtonConstrainBottomSpacing.constant = 20
            self.SegmentedControlConstrainTopSpacing.constant = 180
            self.CreateAccountButtonConstrainBottomSpacing.constant = 20
            
            self.view.updateConstraints()
            self.view.layoutIfNeeded()
            self.view.endEditing(true)
            self.KBCheck = false
            
        }
        
    }// @end of watchHideKeyboard Function
    
    // Needs Comment Description
    func makeHTTPCallToServer (path: String) -> (Void) {
        
        NSURLConnection.sendAsynchronousRequest(
            NSURLRequest(
                URL: NSURL(
                    string: "\(path)") ),
            queue: NSOperationQueue.mainQueue(),
            completionHandler: {
                response,
                data,
                error in
                
                if let jsonDict: NSArray = NSJSONSerialization.JSONObjectWithData(
                    data,
                    options: NSJSONReadingOptions.MutableContainers,
                    error: nil ) as? NSArray {
                        
                        self.FirstNameResponseLabel.text = jsonDict[0].objectForKey("pfname")! as? String
                        self.LastNameResponseLabel.text = jsonDict[0].objectForKey("plname")! as? String
                        self.EmailResponseLabel.text = jsonDict[0].objectForKey("pemail")! as? String
                        self.PasswordResponseLabel.text = jsonDict[0].objectForKey("ppasswd")! as? String
                        
                }else{
                    
                    var datastring: String = NSString(data:data, encoding:NSUTF8StringEncoding)
                    
                    self.FirstNameResponseLabel.text = datastring
                    
                    println(datastring)
                    
                }
                
            })
        
    }// @end of makeHTTPCallToServer Function



    
}// @end of Custom Functions Extention --------------------------------------------------------------------^



