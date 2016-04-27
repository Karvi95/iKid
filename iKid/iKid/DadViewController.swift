//
//  ThirdViewController.swift
//  iKid
//
//  Created by iGuest on 4/27/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class DadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        firstBuilder();
        switchViewController(nil, to: jokesetupViewController)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private var jokesetupViewController : DadQuestViewController!
    private var punchlineViewController : DadAnswerViewController!
    
    
    private func firstBuilder() {
        if jokesetupViewController == nil {
            jokesetupViewController = storyboard?.instantiateViewControllerWithIdentifier("Dad Joke Setup")
                as! DadQuestViewController
        }
    }
    private func secondBuilder() {
        if punchlineViewController == nil {
            punchlineViewController = storyboard?.instantiateViewControllerWithIdentifier("Dad Joke Punchline")
                as! DadAnswerViewController
        }
    }
    
    @IBAction func RevealPunchline(sender: UIButton) {
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if jokesetupViewController != nil && jokesetupViewController?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            punchlineViewController.view.frame = view.frame
            switchViewController(jokesetupViewController, to: punchlineViewController)
        } else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            jokesetupViewController.view.frame = view.frame
            switchViewController(punchlineViewController, to: jokesetupViewController)
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
