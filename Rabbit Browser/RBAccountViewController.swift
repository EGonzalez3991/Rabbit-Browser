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
    var RBLoginImageViews: [UIImageView] = Array()
    var keyboardFrame: CGRect!
    var KBCheck: Bool = false
    var KBCheck2: Bool = false
    
    
    
    
    class testObject: NSObject {
        
        var hw = "hello world"
        
    }
    
    
    
    
     // Interface Builder Outlets Area
    // All Outlets must be implemented here....
    @IBOutlet var RBCreateAccountButton: UIButton!
    @IBOutlet var bottomTest: NSLayoutConstraint!
    
    // Test outlets
    
    @IBOutlet var testLabel0: UILabel!
    @IBOutlet var testLabel1: UILabel!
    @IBOutlet var testLabel2: UILabel!
    @IBOutlet var testLabel3: UILabel!
    @IBOutlet var testLabel4: UILabel!
    @IBOutlet var testLabel5: UILabel!

    
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
        
        // @end ------------------------------------------------------------------------------------------^
        
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
                
            }
            
            self.view.addSubview(RBLoginImageViews[i])
            
        }
        
        self.view.bringSubviewToFront(RBLoginImageViews[0])
        
        centerist()

    }// @end of ViewDidLoad
    
    
    
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    
        coordinator.animateAlongsideTransition({ (UIViewControllerTransitionCoordinatorContext) -> Void in
            
            self.centerist()
            
        }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            
            
        })
        
    }
    
    
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }
    
    
    
    
    func loginAnimation () -> (Void) {
        
        UIView.animateWithDuration(
            0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 10,
            options: UIViewAnimationOptions.BeginFromCurrentState,
            animations: { () -> Void in
                
                self.valuesForLoginAnimation1()
                
            }, completion: { (Bool) -> Void in
                
                UIView.animateWithDuration(
                    0.5,
                    delay: 0,
                    usingSpringWithDamping: 0.3,
                    initialSpringVelocity: 10,
                    options: UIViewAnimationOptions.BeginFromCurrentState,
                    animations: { () -> Void in
                        
                        self.valuesForLoginAnimation2()
                        
                    }, completion: { (Bool) -> Void in
                        
                        
                        
                    })
                
            })
        
    }
    
    
    
    func valuesForLoginAnimation1 () -> (Void) {
        
        self.RBLoginImageViews[0].center = self.view.center
        
        self.RBLoginImageViews[3].center = CGPointMake(self.view.center.x, self.view.center.y - 50)
        self.RBLoginImageViews[1].center = CGPointMake(self.view.center.x - 100, self.view.center.y - 125)
        self.RBLoginImageViews[5].center = CGPointMake(self.view.center.x + 100, self.view.center.y - 50)
        self.RBLoginImageViews[2].center = CGPointMake(self.view.center.x - 75, self.view.center.y + 75)
        self.RBLoginImageViews[4].center = CGPointMake(self.view.center.x + 75, self.view.center.y + 75)
        
    }
    
    
    
    func valuesForLoginAnimation2 () -> (Void) {
        
        self.RBLoginImageViews[0].center = self.view.center
        
        self.RBLoginImageViews[1].center = CGPointMake(self.view.center.x, self.view.center.y - 250)
        self.RBLoginImageViews[2].center = CGPointMake(self.view.center.x - 200, self.view.center.y - 100)
        self.RBLoginImageViews[3].center = CGPointMake(self.view.center.x + 200, self.view.center.y - 100)
        self.RBLoginImageViews[4].center = CGPointMake(self.view.center.x - 150, self.view.center.y + 150)
        self.RBLoginImageViews[5].center = CGPointMake(self.view.center.x + 150, self.view.center.y + 150)
        
    }
    
    
    
    func centerist () -> (Void) {
        
        for (var i = 0; i < 6; i++){
            
            RBLoginImageViews[i].center = self.view.center
            
        }
        
    }
    
    
    
    func KeyboardUp (toSubstrack: CGFloat) -> (Void) {
        
        for (var i = 0; i < 6; i++){
            
            RBLoginImageViews[i].center = CGPointMake(self.view.center.x, self.view.center.y - toSubstrack)
            
        }
        
    }
    
    
    
    func watchShowKeyboard( notification: NSNotification ) {
        
        if !KBCheck {
        
            let NInfo: NSDictionary = notification.userInfo!
            NInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.getValue(&keyboardFrame)
            
            KeyboardUp(keyboardFrame.size.height)
            
            self.bottomTest.constant = 20 + self.keyboardFrame.size.height
            self.view.layoutIfNeeded()
            self.KBCheck = true
            
        }
            
    }
    
    
    
    func watchHideKeyboard( notification: NSNotification ) {
        
        if KBCheck {
            
            let NInfo: NSDictionary = notification.userInfo!
            NInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.getValue(&keyboardFrame)
            
            KeyboardUp(0)
            
            self.bottomTest.constant = 20
            self.view.layoutIfNeeded()
            self.view.endEditing(true)
            self.KBCheck = false
            
        }
        
    }
    
    
    
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
                
                    println( "Server Response: \n \( NSString(data: data, encoding: NSUTF8StringEncoding) )" )
                
                })
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     // Actions Area
    // All actions must be implemented here....
    
    @IBAction func loginButtonAction(sender: AnyObject) {
        
        makeHTTPCallToServer("http://gcwtestapp.herokuapp.com/accountlogin/?pemail=qwesa&ppasswd=1029384756")
        
        
        self.view.endEditing(true)
        
        UIView.animateWithDuration(
            0.25,
            delay: 0,
            usingSpringWithDamping: 0.90,
            initialSpringVelocity: 10,
            options: UIViewAnimationOptions.BeginFromCurrentState,
            animations: { () -> Void in
                
                self.bottomTest.constant = -300
                self.view.layoutIfNeeded()
                
            }, completion: { (Bool) -> Void in
                
                
                self.loginAnimation()
                
                
            })
        
    }
    
}

