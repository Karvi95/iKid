//
//  ProgrammingViewController.swift
//  iKid
//
//  Created by iGuest on 4/28/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ProgrammingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private var jokesetupViewController : ProgramQuestViewController!
    private var punchlineViewController : ProgramAnswerViewController!
    
    private func firstBuilder() {
        if jokesetupViewController == nil {
            jokesetupViewController = storyboard?.instantiateViewControllerWithIdentifier("SetupProgramming")
                as! ProgramQuestViewController
        }
    }
    private func secondBuilder() {
        if punchlineViewController == nil {
            punchlineViewController = storyboard?.instantiateViewControllerWithIdentifier("ProgrammingPunchline")
                as! ProgramAnswerViewController
        }
    }

    @IBAction func RevealPunchline(sender: UIBarButtonItem) {
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if jokesetupViewController != nil &&
            jokesetupViewController?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            punchlineViewController.view.frame = view.frame
            switchViewController(jokesetupViewController, to: punchlineViewController)
        }
        else {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
