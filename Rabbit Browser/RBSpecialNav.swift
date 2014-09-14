//
//  RBSpecialNav.swift
//  Rabbit Browser
//
//  Created by Christopher Gonzalez on 9/13/14.
//  Copyright (c) 2014 gchriswill. All rights reserved.
//

import UIKit

class RBSpecialNavigation {

    var RBLoginButtons: [UIButton] = Array()
    var RBLoginButtonsColors = [UIColor.orangeColor(), UIColor.yellowColor(), UIColor.redColor(), UIColor.purpleColor(), UIColor.blueColor(), UIColor.greenColor() ]
    var NavContainerView = UIView(frame: CGRectMake(0, 0, 250, 250))
    
    func setup (forView: UIView , withButtons: [UIButton] ) ->(UIView) {
        
        for (var i = 0; i < RBLoginButtonsColors.count; i++ ) {
            
            
            RBLoginButtons.append( UIButton() )
            
            
            if i == 0 {
            
                RBLoginButtons[i].frame = CGRectMake(0, 0, 200, 200)
                RBLoginButtons[i].layer.cornerRadius = 100
                RBLoginButtons[i].backgroundColor = RBLoginButtonsColors[i]
                RBLoginButtons[i].setBackgroundImage( UIImage(named: "RBArbyIcon"), forState: UIControlState.Normal )
                
                
            } else if i == 1 {
                
                RBLoginButtons[i].frame = CGRectMake(0, 0, 150, 150)
                RBLoginButtons[i].layer.cornerRadius = 75
                RBLoginButtons[i].backgroundColor = RBLoginButtonsColors[i]
                RBLoginButtons[i].setBackgroundImage( UIImage(named: "RBUserSettings"), forState: UIControlState.Normal )
                
            }else{
                
                RBLoginButtons[i].frame = CGRectMake(0, 0, 100, 100)
                RBLoginButtons[i].layer.cornerRadius = 50
                RBLoginButtons[i].backgroundColor = RBLoginButtonsColors[i]
                RBLoginButtons[i].setBackgroundImage( UIImage(named: "RBUserProfile"), forState: UIControlState.Normal )
                
            }// @end of If Condition
            
            NavContainerView.addSubview(RBLoginButtons[i])
            
        }// @end of For Loop
        
        NavContainerView.bringSubviewToFront(RBLoginButtons[0])

        return NavContainerView
    }
    
    func NavShow () -> (Void){
        
    }
    
    func NavHide () -> (Void){
        
    }
    
}
