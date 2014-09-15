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
    
    func animateFormElementValues (lbottom: CGFloat, sct: CGFloat, cab: CGFloat) -> (Void) {
        
        self.LoginButtonConstrainBottomSpacing.constant = lbottom
        self.SegmentedControlConstrainTopSpacing.constant = sct
        self.CreateAccountButtonConstrainBottomSpacing.constant = cab
        
        self.view.layoutIfNeeded()
        
    }
    
    func segmentedloginAccountAnimationValues () -> (Void) {
        
        self.RBLoginButton.alpha = 1
        self.LoginButtonConstrainCenterX.constant = 0
        
        self.RBCreateAccountButton.alpha = 0
        self.CreateAccountButtonConstrainCenterX.constant = -570
        
        self.RBEmailLabel.textAlignment = NSTextAlignment.Left
        self.RBPasswordLabel.textAlignment = NSTextAlignment.Left
        
        self.PasswordTextFieldConstrainWide.constant = 360
        self.PasswordTextFieldConstrainCenterX.constant = 0
        
        self.RBConfirmPasswordLabel.alpha = 0
        self.RBConfirmPasswordTextField.alpha = 0
        self.ConfirmPasswordTextFieldConstrainWide.constant = 360
        self.ConfirmPasswordTextFieldConstrainCenterX.constant = -570
        
        self.RBFirstNameLabel.alpha = 0
        self.RBFirstNameTextField.alpha = 0
        self.RBLastNameLabel.alpha = 0
        self.RBLastNameTextField.alpha = 0
        self.LastNameTextFieldConstrainWide.constant = 360
        self.LastNameTextFieldConstrainCenterX.constant = -570
        
        self.view.layoutIfNeeded()
        
    }
    
    func thirdSetSegmentedCreateAccountAnimationValues () -> (Void) {
        
        self.RBFirstNameLabel.alpha = 1
        self.RBFirstNameTextField.alpha = 1
        self.RBLastNameLabel.alpha = 1
        self.RBLastNameTextField.alpha = 1
        
        self.LastNameTextFieldConstrainWide.constant = 300
        self.LastNameTextFieldConstrainCenterX.constant = -184
        
        self.view.layoutIfNeeded()
        
    }
    
    func secondSetSegmentedCreateAccountAnimationValues () -> (Void) {
        
        self.PasswordTextFieldConstrainWide.constant = 300
        
        self.RBConfirmPasswordLabel.alpha = 1
        self.RBConfirmPasswordTextField.alpha = 1
        self.ConfirmPasswordTextFieldConstrainWide.constant = 300
        
        self.PasswordTextFieldConstrainCenterX.constant = 184
        self.ConfirmPasswordTextFieldConstrainCenterX.constant = 184
        
        self.RBEmailLabel.textAlignment = NSTextAlignment.Center
        self.RBPasswordLabel.textAlignment = NSTextAlignment.Center
        
        self.view.layoutIfNeeded()
        
    }
    
    func firstSetSegmentedCreateAccountAnimationValues () -> (Void) {
        
        self.RBLoginButton.alpha = 0
        self.LoginButtonConstrainCenterX.constant = 570
        
        self.RBCreateAccountButton.alpha = 1
        self.CreateAccountButtonConstrainCenterX.constant = 0
        
        self.view.layoutIfNeeded()
        
    }
    
    // Needs Comment Description
    func watchShowKeyboard( notification: NSNotification ) {
        
        if !KBCheck {
            
            let NInfo: NSDictionary = notification.userInfo!
            NInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.getValue(&keyboardFrame)
            
            self.RBNavContainerConstrainAlignCenterY.constant = 0 + self.keyboardFrame.size.height
            
            self.LoginButtonConstrainBottomSpacing.constant = 20 + self.keyboardFrame.size.height
            self.SegmentedControlConstrainTopSpacing.constant = 180 - self.keyboardFrame.size.height
            self.CreateAccountButtonConstrainBottomSpacing.constant = 20 + self.keyboardFrame.size.height
            
            self.view.layoutIfNeeded()
            
            self.KBCheck = true
            
        }
        
    }// @end of watchShowKeyboard Function
    
    // Needs Comment Description
    func watchHideKeyboard( notification: NSNotification ) {
        
        self.view.endEditing(true)
        
        if KBCheck {
            
            let NInfo: NSDictionary = notification.userInfo!
            NInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.getValue(&keyboardFrame)
            
            self.RBNavContainerConstrainAlignCenterY.constant = 0
            
            self.LoginButtonConstrainBottomSpacing.constant = 20
            self.SegmentedControlConstrainTopSpacing.constant = 180
            self.CreateAccountButtonConstrainBottomSpacing.constant = 20
            
            self.view.layoutIfNeeded()
            
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
    
    func setUpGearsAnimation ( counter: Int, timer: NSTimeInterval) -> (Void){
        
        self.RBNavButtonsCollection[0].imageView!.animationImages = [
            UIImage(named: "RBSettings1"),
            UIImage(named: "RBSettings2"),
            UIImage(named: "RBSettings3"),
            UIImage(named: "RBSettings4") ]
        
        self.RBNavButtonsCollection[0].imageView!.animationDuration = timer
        self.RBNavButtonsCollection[0].imageView!.animationRepeatCount = counter
        
    }
    
    func showLoginAccountForm () -> (Void) {
        
        UIView.animateWithDuration(
            1,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 10,
            options: UIViewAnimationOptions.BeginFromCurrentState,
            animations: { () -> Void in
                
                self.segmentedloginAccountAnimationValues()
                
            }, completion: { (Bool) -> Void in
                
                self.SegmentedAccountOptionsControl.setEnabled(true, forSegmentAtIndex: 1)
                
            })
        
    }
    
    func showCreateAccountForm () -> (Void) {
        
        UIView.animateWithDuration(
            1,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 10,
            options: UIViewAnimationOptions.AllowAnimatedContent,
            animations: { () -> Void in
                
                self.firstSetSegmentedCreateAccountAnimationValues()
                
            }, completion: { (Bool) -> Void in
                
                UIView.animateWithDuration(
                    0.5,
                    delay: 0,
                    usingSpringWithDamping: 0.9,
                    initialSpringVelocity: 10,
                    options: UIViewAnimationOptions.BeginFromCurrentState,
                    animations: { () -> Void in
                        
                        self.secondSetSegmentedCreateAccountAnimationValues()
                        
                    }, completion: { (Bool) -> Void in
                        
                        UIView.animateWithDuration(
                            0.5,
                            delay: 0,
                            usingSpringWithDamping: 0.9,
                            initialSpringVelocity: 10,
                            options: UIViewAnimationOptions.BeginFromCurrentState,
                            animations: { () -> Void in
                                
                                self.thirdSetSegmentedCreateAccountAnimationValues()
                                
                            }, completion: { (Bool) -> Void in
                                
                                self.SegmentedAccountOptionsControl.setEnabled(true, forSegmentAtIndex: 0)
                                println("Sliding Form animation was executed")
                                
                            })
                        
                    })
                
            })
        
    }

    
}// @end of Custom Functions Extention --------------------------------------------------------------------^



