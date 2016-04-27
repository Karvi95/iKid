//
//  FirstViewController.swift
//  iKid
//
//  Created by iGuest on 4/27/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        firstBuilder();
        switchViewController(nil, to: setupViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private var setupViewController : ProgrammingQuestViewController!
    private var punchlineViewController : ProgrammingAnswerViewController!

    
    private func firstBuilder() {
        if setupViewController == nil {
            setupViewController = storyboard?.instantiateViewControllerWithIdentifier("Programming Setup")
            as! ProgrammingQuestViewController
        }
    }
    private func secondBuilder() {
        if punchlineViewController == nil {
            punchlineViewController = storyboard?.instantiateViewControllerWithIdentifier("Programming Punchline")
            as! ProgrammingAnswerViewController
        }
    }
    
    @IBAction func RevealPunchline(sender: UIBarButtonItem) {
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if setupViewController != nil && setupViewController?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            punchlineViewController.view.frame = view.frame
            switchViewController(setupViewController, to: punchlineViewController)
        } else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            setupViewController.view.frame = view.frame
            switchViewController(punchlineViewController, to: setupViewController)
        }
     UIView.commitAnimations()
    }
    
    private func switchViewController(from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMoveToParentViewController(nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, atIndex: 0)
            to!.didMoveToParentViewController(self)
        }
    }
}
