        //                                                               \\
       //  ViewController.swift                                           \\
      //  Rabbit Browser                                                   \\
     //                                                                     \\
    //  Created by Christopher and Ernesto, both Gonzalez, on 9/5/14.        \\
   //  Copyright (c) 2014 gchriswill. All rights reserved.                    \\
  //                                                                           \\
 // IMPORTANT NOTE! You are working in the gchriswill-workspace branch!         \\
//_______________________________________________________________________________\\

import UIKit

class RBAccountViewController: UIViewController, UITextFieldDelegate {
    
    
    
    
     // Custom Variable Area
    // All custom variable must be implemented here....
    var RBLoginImageViews: [UIImageView] = Array()
    var keyboardFrame: CGRect!
    var KBCheck: Bool = false
    var KBCheck2: Bool = false
    
    
    
    
      // Interface Builder Outlets Main Area
     // All Outlets must be implemented here....
    // UI Outlets
    @IBOutlet var SegmentedAccountOptionsControl: UISegmentedControl!
    @IBOutlet var RBEmailTextField: UITextField!
    @IBOutlet var RBFirstNameTextField: UITextField!
    @IBOutlet var RBPasswordTextField: UITextField!
    @IBOutlet var RBLoginButton: UIButton!
    @IBOutlet var RBFirstNameLabel: UILabel!
    @IBOutlet var RBLastNameLabel: UILabel!
    @IBOutlet var RBLastNameTextField: UITextField!
    @IBOutlet var RBConfirmPasswordLabel: UILabel!
    @IBOutlet var RBConfirmPasswordTextField: UITextField!
    @IBOutlet var RBCreateAccountButton: UIButton!
    // Test outlets
    @IBOutlet var FirstNameResponseLabel: UILabel!
    @IBOutlet var LastNameResponseLabel: UILabel!
    @IBOutlet var EmailResponseLabel: UILabel!
    @IBOutlet var PasswordResponseLabel: UILabel!
    
    // Constrains Outlets
    @IBOutlet var SegmentedControlConstrainTopSpacing: NSLayoutConstraint!
    @IBOutlet var PasswordTextFieldConstrainCenterX: NSLayoutConstraint!
    @IBOutlet var PasswordTextFieldConstrainWide: NSLayoutConstraint!
    @IBOutlet var LoginButtonConstrainCenterX: NSLayoutConstraint!
    @IBOutlet var LoginButtonConstrainBottomSpacing: NSLayoutConstraint!
    @IBOutlet var LastNameTextFieldConstrainCenterX: NSLayoutConstraint!
    @IBOutlet var LastNameTextFieldConstrainWide: NSLayoutConstraint!
    @IBOutlet var ConfirmPasswordTextFieldConstrainCenterX: NSLayoutConstraint!
    @IBOutlet var ConfirmPasswordTextFieldConstrainWide: NSLayoutConstraint!
    @IBOutlet var CreateAccountButtonConstrainCenterX: NSLayoutConstraint!
    @IBOutlet var CreateAccountButtonConstrainBottomSpacing: NSLayoutConstraint!
    
    
    

 // RBAccount View Controller Native Methods Area
// All Native Methods must be implemented here....
    override func viewDidLoad() {
    
        super.viewDidLoad()
         // Do any additional setup after loading the view, typically from a nib.
        /*
        
            DEFAULT NOTIFICATION CENTER OBSERVER OBJECT REGISTRATION
            
            Here we are regitering an Observer Object to the default notification center for providing
            notifications packed with the frame's cofiguration of the iOS keyboard. This notification are 
            delivered everytime the system starts animating the keyboard for displaying it. The technique 
            consist of implementing two "addObserver" methods. One for watching when the system pop up the 
            keyboard and the other is for watching when the system drop down the keyboard.
            
            @gchriswill
        
        */
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: Selector("watchShowKeyboard:"),
            name: UIKeyboardWillShowNotification,
            object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: Selector("watchHideKeyboard:"),
            name: UIKeyboardWillHideNotification,
            object: nil)
        
        // @end @gchriswill's Comment ------------------------------------------------------------------------------------------^
        
        var RBLoginImageViewsColors = [UIColor.orangeColor(), UIColor.yellowColor(), UIColor.redColor(), UIColor.purpleColor(), UIColor.blueColor(), UIColor.greenColor() ]
        
        for (var i = 0; i < RBLoginImageViewsColors.count; i++ ) {
            
            RBLoginImageViews.append( UIImageView() )
            
            if i == 0 {
                
                RBLoginImageViews[i].frame = CGRectMake(0, 0, 200, 200)
                RBLoginImageViews[i].layer.cornerRadius = 100
                RBLoginImageViews[i].backgroundColor = RBLoginImageViewsColors[i]
                RBLoginImageViews[i].image = UIImage(named: "RBArbyIcon")
                
                
            } else if i == 1 {
            
                RBLoginImageViews[i].frame = CGRectMake(0, 0, 150, 150)
                RBLoginImageViews[i].layer.cornerRadius = 75
                RBLoginImageViews[i].backgroundColor = RBLoginImageViewsColors[i]
                RBLoginImageViews[i].image = UIImage(named: "RBUserSettings")
                
            }else{
                
                RBLoginImageViews[i].frame = CGRectMake(0, 0, 100, 100)
                RBLoginImageViews[i].layer.cornerRadius = 50
                RBLoginImageViews[i].backgroundColor = RBLoginImageViewsColors[i]
                RBLoginImageViews[i].image = UIImage(named: "RBUserProfile")
                
            }// @end of If Condition
            
            self.view.addSubview(RBLoginImageViews[i])
            
        }// @end of For Loop
        
        self.view.bringSubviewToFront(RBLoginImageViews[0])
        
        centerist()

    }// @end of ViewDidLoad
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    
        coordinator.animateAlongsideTransition({ (UIViewControllerTransitionCoordinatorContext) -> Void in
            
            self.centerist()
            self.view.updateConstraints()
            self.view.layoutIfNeeded()
            
            
            }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            
            
            })
        
    }// @end of viewWillTransitionToSize
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }// @end of touchesBegan
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }// @end of didReceiveMemoryWarning
    
// @end of Native Methods area -----------------------------------------------------------------^

    
    
    
 // Actions Area
// All actions must be implemented here....
    
    // Needs Comment Description
    @IBAction func SegmentedAccountOptionsAction(sender: UISegmentedControl) {
        
        if self.SegmentedAccountOptionsControl.selectedSegmentIndex == 1 {
            
            self.SegmentedAccountOptionsControl.setEnabled(false, forSegmentAtIndex: 0)
            
            UIView.animateWithDuration(
                1,
                delay: 0,
                usingSpringWithDamping: 0.9,
                initialSpringVelocity: 10,
                options: UIViewAnimationOptions.AllowAnimatedContent,
                animations: { () -> Void in
                    
                    self.RBLoginButton.alpha = 0
                    self.LoginButtonConstrainCenterX.constant = 570
                    
                    self.RBCreateAccountButton.alpha = 1
                    self.CreateAccountButtonConstrainCenterX.constant = 0
                    
                    self.view.updateConstraints()
                    self.view.layoutIfNeeded()
                    
                }, completion: { (Bool) -> Void in
                    
                    UIView.animateWithDuration(
                        0.5,
                        delay: 0,
                        usingSpringWithDamping: 0.9,
                        initialSpringVelocity: 10,
                        options: UIViewAnimationOptions.BeginFromCurrentState,
                        animations: { () -> Void in
                            
                            self.PasswordTextFieldConstrainWide.constant = 300
                            
                            self.RBConfirmPasswordLabel.alpha = 1
                            self.RBConfirmPasswordTextField.alpha = 1
                            self.ConfirmPasswordTextFieldConstrainWide.constant = 300
                            
                            self.PasswordTextFieldConstrainCenterX.constant = 184
                            self.ConfirmPasswordTextFieldConstrainCenterX.constant = 184
                            
                            self.view.updateConstraints()
                            self.view.layoutIfNeeded()
                            
                        }, completion: { (Bool) -> Void in
                            
                            UIView.animateWithDuration(
                                0.5,
                                delay: 0,
                                usingSpringWithDamping: 0.9,
                                initialSpringVelocity: 10,
                                options: UIViewAnimationOptions.BeginFromCurrentState,
                                animations: { () -> Void in
                                    
                                    // This on is to break my one animation record 3 in a animation chain
                                    self.RBFirstNameLabel.alpha = 1
                                    self.RBFirstNameTextField.alpha = 1
                                    self.RBLastNameLabel.alpha = 1
                                    self.RBLastNameTextField.alpha = 1
                                    
                                    self.LastNameTextFieldConstrainWide.constant = 300
                                    self.LastNameTextFieldConstrainCenterX.constant = -184
                                    
                                    self.view.updateConstraints()
                                    self.view.layoutIfNeeded()
                                    
                                }, completion: { (Bool) -> Void in
                                    
                                    self.SegmentedAccountOptionsControl.setEnabled(true, forSegmentAtIndex: 0)
                                    println("Sliding Form animation was executed")
                                    
                                })
                            
                        })
                    
                })
            
        }else{
            
            self.SegmentedAccountOptionsControl.setEnabled(false, forSegmentAtIndex: 1)
            
            UIView.animateWithDuration(
                1,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 10,
                options: UIViewAnimationOptions.BeginFromCurrentState,
                animations: { () -> Void in
                    
                    self.RBLoginButton.alpha = 1
                    self.LoginButtonConstrainCenterX.constant = 0
                    
                    self.RBCreateAccountButton.alpha = 0
                    self.CreateAccountButtonConstrainCenterX.constant = -570
                    
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
                    
                    self.view.updateConstraints()
                    self.view.layoutIfNeeded()
                    
                    
                }, completion: { (Bool) -> Void in
            
                    self.SegmentedAccountOptionsControl.setEnabled(true, forSegmentAtIndex: 1)
                
                })
            
        }// @end of If Condition
        
    }// @end of SegmentedAccountOptionsAction IBAction
    
    // Needs Comment Description
    @IBAction func loginButtonAction(sender: AnyObject) {
        
        makeHTTPCallToServer("http://gcwtestapp.herokuapp.com/accountlogin/?pemail=\(RBEmailTextField.text as String!)&ppasswd=\(RBPasswordTextField.text as String!)")
        
        UIView.animateWithDuration(
            0.25,
            delay: 0,
            usingSpringWithDamping: 0.90,
            initialSpringVelocity: 10,
            options: UIViewAnimationOptions.BeginFromCurrentState,
            animations: { () -> Void in
                
                self.LoginButtonConstrainBottomSpacing.constant = -300
                self.SegmentedControlConstrainTopSpacing.constant = -55
                self.CreateAccountButtonConstrainBottomSpacing.constant = -125
                self.view.updateConstraints()
                self.view.layoutIfNeeded()
                
            }, completion: { (Bool) -> Void in
                
                
                self.loginAnimation()
                
                
            })
        
    }// @end of loginButtonAction IBAction
    
    // Needs Comment Description
    @IBAction func createAccountButtonAction(sender: AnyObject) {
        
        makeHTTPCallToServer("http://gcwtestapp.herokuapp.com/createaccount/?pfname=\(RBFirstNameTextField.text as String!)&plname=\(RBLastNameTextField.text as String!)&pemail=\(RBEmailTextField.text as String!)&ppasswd=\(RBPasswordTextField.text as String!)")
        
        self.view.endEditing(true)
        
        UIView.animateWithDuration(
            0.25,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 10,
            options: UIViewAnimationOptions.BeginFromCurrentState,
            animations: { () -> Void in
                
               
                self.SegmentedControlConstrainTopSpacing.constant = -55
                self.LoginButtonConstrainBottomSpacing.constant = -300
                self.CreateAccountButtonConstrainBottomSpacing.constant = -125
                
                self.view.updateConstraints()
                self.view.layoutIfNeeded()
                
            }, completion: { (Bool) -> Void in
                
                
                self.loginAnimation()
                
            })
        
    }// @end of createAccountButtonAction IBAction





// @end of IBAction Methods Area ----------------------------------------------------------------^
} // @end of RBAccountViewController Class


        
        