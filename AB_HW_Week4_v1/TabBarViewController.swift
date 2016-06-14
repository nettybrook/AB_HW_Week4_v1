//
//  TabBarViewController.swift
//  AB_HW_Week4_v1
//
//  Created by Annette Brookman on 6/10/16.
//  Copyright © 2016 Annette Brookman. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    
    // Define variables to hold each ViewController associated with a tab.
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var composeViewController: UIViewController!
    
    // Define a variable for an array to hold the ViewControllers named, viewControllers.
    var viewControllers: [UIViewController]!
    

    @IBOutlet weak var bubbleImageView: UIImageView!
    
    // Keep track of the tab button that is selected. Set it to an initial value of 0
    var selectedIndex: Int = 0
    
    var fadeTransition: FadeTransition!
 
    override func viewDidLoad() {


        // Access the main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Adding each view controller to the view controller array
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        // Set the button state and call the didPressTab method. We will plug in buttons[selectedIndex] as arguments in the didPressTab method to specify the initial button, since we haven't actually "tapped" a button yet and there is no sender to access.
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
    
        UIView.animateWithDuration(2, delay: 0.0, options:[UIViewAnimationOptions.Repeat, UIViewAnimationOptions.Autoreverse], animations: {
            self.bubbleImageView.frame.origin.y = 50
            self.bubbleImageView.frame.origin.y = 37
            
            }, completion: nil)

        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Shared action for the tab buttons
    @IBAction func didPressTab(sender: UIButton) {
    
    // keep track of the previous button
    let previousIndex = selectedIndex
    
        // checks the tag number of the selected button
        self.selectedIndex = sender.tag
        
        // Access the previous button and set it's selected state to false - unselected
        buttons[previousIndex].selected = false
        
        // Access the previous view controllers from the view controllers array
        let previousVC = viewControllers[previousIndex]
        
        // Remove the previous view controllers
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        // Acces the current selected button and set it's selected state to true - selected
        sender.selected = true
        
        //Use the selectedIndex to access the current ViewController from the viewControllers array
        let vc = viewControllers[selectedIndex]
        
        //Add the new ViewController. (Calls the viewWillAppear method of the ViewController you are adding)
        addChildViewController(vc)
        
        // Adjust the size of the ViewController view you are adding to match the contentView of your tabBarViewController and add it as a subView of the contentView.
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        
        //Call the viewDidAppear method of the ViewController you are adding using didMoveParentViewController(self).
        vc.didMoveToParentViewController(self)
        
        if selectedIndex == 1 {
            print("search touched")
            
            self.bubbleImageView.alpha = 0
            
        } else {
            
            print("something else touched")
            
            self.bubbleImageView.alpha = 1
        }
   
    }
    

    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         Get the new view controller using segue.destinationViewController.
         Pass the selected object to the new view controller.
    }
    */

}
