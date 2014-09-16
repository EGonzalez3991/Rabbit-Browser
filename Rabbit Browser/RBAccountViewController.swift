        //                                                               \\
       //  ViewController.swift                                           \\
      //  Rabbit Browser                                                   \\
     //                                                                     \\
    //  Created by Christopher Gonzalez on 9/5/14.                           \\
   //  Copyright (c) 2014 gchriswill. All rights reserved.                    \\
  //                                                                           \\
 // IMPORTANT NOTE! You are working in the gchriswill-workspace branch!         \\
//_______________________________________________________________________________\\

import UIKit

class RBAccountViewController: UIViewController, UITextFieldDelegate {
    
   
    
    
     // Custom Variable Area
    // All custom variable must be implemented here....
    
    var keyboardFrame: CGRect!
    var KBCheck: Bool = false
    var KBCheck2: Bool = false
    
    
    
    
      // Interface Builder Outlets Main Area
     // All Outlets must be implemented here....
    // UI Outlets
    @IBOutlet var SegmentedAccountOptionsControl: UISegmentedControl!
    @IBOutlet var RBEmailLabel: UILabel!
    @IBOutlet var RBEmailTextField: UITextField!
    @IBOutlet var RBFirstNameLabel: UILabel!
    @IBOutlet var RBFirstNameTextField: UITextField!
    @IBOutlet var RBPasswordLabel: UILabel!
    @IBOutlet var RBPasswordTextField: UITextField!
    @IBOutlet var RBLoginButton: UIButton!
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
    @IBOutlet var testCloseButton: UIButton!
    
    
    
    
    @IBOutlet var RBNavButtonsCollection: [UIButton]!
    
    //Gears X and Y Align Center and W and H Sizes Class RxR Constrains
    @IBOutlet var RBGearsConstrainAlignCenterX: NSLayoutConstraint!
    @IBOutlet var RBGearsConstrainAlignCenterY: NSLayoutConstraint!
    @IBOutlet var RBGearsConstrainWidth: NSLayoutConstraint!
    @IBOutlet var RBGearsConstrainHeight: NSLayoutConstraint!
    
    //Profile1 X and Y Align Center and W and H Sizes Class RxR Constrains
    @IBOutlet var RBProfile1ConstrainAlignCenterX: NSLayoutConstraint!
    @IBOutlet var RBProfile1ConstrainAlignCenterY: NSLayoutConstraint!
    @IBOutlet var RBProfile1ConstrainWidth: NSLayoutConstraint!
    @IBOutlet var RBProfile1ConstrainHeight: NSLayoutConstraint!
    
    //Profile2 X and Y Align Center and W and H Sizes Class RxR Constrains
    @IBOutlet var RBProfile2ConstrainAlignCenterX: NSLayoutConstraint!
    @IBOutlet var RBProfile2ConstrainAlignCenterY: NSLayoutConstraint!
    @IBOutlet var RBProfile2ConstrainWidth: NSLayoutConstraint!
    @IBOutlet var RBProfile2ConstrainHeight: NSLayoutConstraint!
    
    //Profile3 X and Y Align Center and W and H Sizes Class RxR Constrains
    @IBOutlet var RBProfile3ConstrainAlignCenterX: NSLayoutConstraint!
    @IBOutlet var RBProfile3ConstrainAlignCenterY: NSLayoutConstraint!
    @IBOutlet var RBProfile3ConstrainWidth: NSLayoutConstraint!
    @IBOutlet var RBProfile3ConstrainHeight: NSLayoutConstraint!
    
    //Profile4 X and Y Align Center and W and H Sizes Class RxR Constrains
    @IBOutlet var RBProfile4ConstrainAlignCenterX: NSLayoutConstraint!
    @IBOutlet var RBProfile4ConstrainAlignCenterY: NSLayoutConstraint!
    @IBOutlet var RBProfile4ConstrainWidth: NSLayoutConstraint!
    @IBOutlet var RBProfile4ConstrainHeight: NSLayoutConstraint!
    
    
    @IBOutlet var RBMainControl: UIImageView!
    @IBOutlet var MainControlConstrainAlignCenterX: NSLayoutConstraint!
    @IBOutlet var MainControlConstrainAlignCenterY: NSLayoutConstraint!
    @IBOutlet var MainControlConstrainWidth: NSLayoutConstraint!
    @IBOutlet var MainControlConstrainHeight: NSLayoutConstraint!
    
    @IBOutlet var RBNavContainer: UIView!
    @IBOutlet var RBNavContainerConstrainAlignCenterX: NSLayoutConstraint!
    @IBOutlet var RBNavContainerConstrainAlignCenterY: NSLayoutConstraint!
    
    
    
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
        
        RBMainControl.layer.cornerRadius = 100
        for button in RBNavButtonsCollection {
            
            button.layer.cornerRadius = 50
            button.layer.masksToBounds = true
            
        }
        RBNavButtonsCollection[0].layer.cornerRadius = 62.5
        setUpGearsAnimation(5, timer: 0.3)
        
    }// @end of ViewDidLoad
    
//    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
//    
//        coordinator.animateAlongsideTransition({ (UIViewControllerTransitionCoordinatorContext) -> Void in
//            
//            
//            }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
//            
//            
//            })
//        
//    }// @end of viewWillTransitionToSize
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }// @end of touchesBegan
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//
//    }
    
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
            
            self.showCreateAccountForm()
            
        }else{
            
            self.SegmentedAccountOptionsControl.setEnabled(false, forSegmentAtIndex: 1)
            
            self.showLoginAccountForm()
            
        }// @end of If Condition
        
    }// @end of SegmentedAccountOptionsAction IBAction
    
    // Needs Comment Description
    @IBAction func loginButtonAction(sender: AnyObject) {
        
        self.view.endEditing(true)
        
//        dispatch_async(dispatch_get_global_queue(0, 0), { () -> Void in
//            
//            self.makeHTTPCallToServer("http://gcwtestapp.herokuapp.com/accountlogin/?pemail=\(self.RBEmailTextField.text as String!)&ppasswd=\(self.RBPasswordTextField.text as String!)")
//            
//        })
        
        UIView.animateWithDuration(
            0.25,
            delay: 0,
            usingSpringWithDamping: 0.90,
            initialSpringVelocity: 10,
            options: UIViewAnimationOptions.AllowAnimatedContent,
            animations: { () -> Void in
                
                self.animateFormElementValues(-400, sct: -55, cab: -125)
                
            }, completion: { (Bool) -> Void in
                
                self.SegmentedAccountOptionsControl.hidden = true
                self.showControls()
                
            })
        
    }// @end of loginButtonAction IBAction
    
    // Needs Comment Description
    @IBAction func createAccountButtonAction(sender: AnyObject) {
        
        self.view.endEditing(true)
        
//        dispatch_async(dispatch_get_global_queue(0, 0), { () -> Void in
//            
//            self.makeHTTPCallToServer("http://gcwtestapp.herokuapp.com/createaccount/?pfname=\(self.RBFirstNameTextField.text as String!)&plname=\(self.RBLastNameTextField.text as String!)&pemail=\(self.RBEmailTextField.text as String!)&ppasswd=\(self.RBPasswordTextField.text as String!)")
//        
//        })
        
        UIView.animateWithDuration(
            0.25,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 10,
            options: UIViewAnimationOptions.BeginFromCurrentState,
            animations: { () -> Void in
                
                self.animateFormElementValues(-400, sct: -55, cab: -125)
                
            }, completion: { (Bool) -> Void in
                
                self.SegmentedAccountOptionsControl.hidden = true
                self.showControls()
                
            })
        
    }// @end of createAccountButtonAction IBAction
    
    @IBAction func settingsButtonAction(sender: AnyObject) {
    
        
        self.RBNavButtonsCollection[0].imageView!.startAnimating()
        self.performSegueWithIdentifier("PresentationSegueToDashboard", sender: nil)
    }
    
    @IBAction func testCloseNavAction(sender: AnyObject) {
        
        self.hideControls()
        
        
    }

// @end of IBAction Methods Area ----------------------------------------------------------------^
    
} // @end of RBAccountViewController Class


        
        