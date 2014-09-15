//
//  RBAccountNavigation.swift
//  Rabbit Browser
//
//  Created by Christopher Gonzalez on 9/15/14.
//  Copyright (c) 2014 gchriswill. All rights reserved.
//

import UIKit

extension RBAccountViewController {
    
    func mainControlReSize (mcw: CGFloat, rbmcl: CGFloat, mch: CGFloat) -> (Void) {
        
        self.MainControlConstrainWidth.constant = mcw
        self.RBMainControl.layer.cornerRadius = rbmcl
        self.MainControlConstrainHeight.constant = mch
    }
    
    func setAnimationValuesFirstHalf () -> (Void) {
        
        
        //self.RBMainControl.bounds = CGRectMake(0, 0, 150, 150)
        
        self.RBGearsConstrainAlignCenterX.constant = 100
        self.RBGearsConstrainAlignCenterY.constant = 75
        
        self.RBProfile1ConstrainAlignCenterX.constant = 62.5
        self.RBProfile1ConstrainAlignCenterY.constant = -50
        
        self.RBProfile2ConstrainAlignCenterX.constant = -62.5
        self.RBProfile2ConstrainAlignCenterY.constant = -50
        
        self.RBProfile3ConstrainAlignCenterX.constant = -100
        self.RBProfile3ConstrainAlignCenterY.constant = 75
        
        self.RBProfile4ConstrainAlignCenterX.constant = 0
        self.RBProfile4ConstrainAlignCenterY.constant = 137.5
        
        self.RBNavContainer.updateConstraintsIfNeeded()
        self.RBNavContainer.layoutIfNeeded()
        
    }
    
    func setAnimationValuesSecondHalf () -> (Void) {
        
        //self.RBMainControl.bounds = CGRectMake(0, 0, 150, 150)
        
        self.RBGearsConstrainAlignCenterX.constant = 0
        self.RBGearsConstrainAlignCenterY.constant = 275
        
        self.RBProfile1ConstrainAlignCenterX.constant = 200
        self.RBProfile1ConstrainAlignCenterY.constant = 150
        
        self.RBProfile2ConstrainAlignCenterX.constant = 125
        self.RBProfile2ConstrainAlignCenterY.constant = -175
        
        self.RBProfile3ConstrainAlignCenterX.constant = -125
        self.RBProfile3ConstrainAlignCenterY.constant = -175
        
        self.RBProfile4ConstrainAlignCenterX.constant = -200
        self.RBProfile4ConstrainAlignCenterY.constant = 150
        
        self.RBNavContainer.updateConstraintsIfNeeded()
        self.RBNavContainer.layoutIfNeeded()
    
    }
    
    func resetToDefaultValues () -> (Void) {
        
        self.RBGearsConstrainAlignCenterX.constant = 0
        self.RBGearsConstrainAlignCenterY.constant = 0
        
        self.RBProfile1ConstrainAlignCenterX.constant = 0
        self.RBProfile1ConstrainAlignCenterY.constant = 0
        
        self.RBProfile2ConstrainAlignCenterX.constant = 0
        self.RBProfile2ConstrainAlignCenterY.constant = 0
        
        self.RBProfile3ConstrainAlignCenterX.constant = 0
        self.RBProfile3ConstrainAlignCenterY.constant = 0
        
        self.RBProfile4ConstrainAlignCenterX.constant = 0
        self.RBProfile4ConstrainAlignCenterY.constant = 0
        
        self.RBNavContainer.updateConstraintsIfNeeded()
        self.RBNavContainer.layoutIfNeeded()
        
    }
    
    func showControls () -> (Void) {
        
        UIView.animateWithDuration(
            0.2,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 10,
            options: UIViewAnimationOptions.AllowAnimatedContent,
            animations: { () -> Void in
                
                self.mainControlReSize(150, rbmcl: 75, mch: 150)
                self.setAnimationValuesFirstHalf()
                
            }, completion: { (Bool) -> Void in
                
                self.RBNavButtonsCollection[0].imageView!.startAnimating()
                
                UIView.animateWithDuration(
                    0.8,
                    delay: 0,
                    usingSpringWithDamping: 0.75,
                    initialSpringVelocity: 0.8,
                    options: UIViewAnimationOptions.AllowAnimatedContent,
                    animations: { () -> Void in
                        
                        self.setAnimationValuesSecondHalf()
                        
                    }, completion: { (Bool) -> Void in
                        
                        self.testCloseButton.hidden = false
                        self.testCloseButton.enabled = true
                    
                    })
                
            })
        
    }// @end of showControls Function
    
    func hideControls () -> (Void) {
        
        UIView.animateWithDuration(
            0.2,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 10,
            options: UIViewAnimationOptions.AllowAnimatedContent,
            animations: { () -> Void in
                
                self.mainControlReSize(200, rbmcl: 100, mch: 200)
                self.setAnimationValuesFirstHalf()
                
            }, completion: { (Bool) -> Void in
                
                self.RBNavButtonsCollection[0].imageView!.startAnimating()
                self.SegmentedAccountOptionsControl.hidden = false
                
                UIView.animateWithDuration(
                    0.8,
                    delay: 0,
                    usingSpringWithDamping: 0.75,
                    initialSpringVelocity: 0.8,
                    options: UIViewAnimationOptions.AllowAnimatedContent,
                    animations: { () -> Void in
                        
                        self.animateFormElementValues(20, sct: 148, cab: 20)
                        self.resetToDefaultValues()
                        
                    }, completion: { (Bool) -> Void in
                        
                        self.testCloseButton.hidden = true
                        self.testCloseButton.enabled = false
                        
                    })
                
            })
        
    }// @end of hideControls Function
    
}// @end of Class Extension