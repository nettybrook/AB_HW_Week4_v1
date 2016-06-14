//
//  LoginViewController.swift
//  AB_HW_Week4_v1
//
//  Created by Annette Brookman on 6/12/16.
//  Copyright © 2016 Annette Brookman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginView: UIView!
    

    var initialFieldY: CGFloat!
    var offsetField: CGFloat!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        
        initialFieldY = loginView.frame.origin.y
        offsetField = -50

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        loginView.frame.origin.y = initialFieldY + offsetField
    
    }

    func keyboardWillHide(notification: NSNotification!) {
       
        loginView.frame.origin.y = initialFieldY
    
    }
    

    @IBAction func onTapCancel(sender: UIButton) {
    
       cancelButton.backgroundColor = UIColor(red:4/255, green: 250/255, blue: 232/255, alpha: 1.0)

        runAfterDelay(0.5) {
            self.view.endEditing(true)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
       
        
        
    }
    
    func runAfterDelay(delay: NSTimeInterval, block: dispatch_block_t) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue(), block)
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
