//
//  ComposeViewController.swift
//  AB_HW_Week4_v1
//
//  Created by Annette Brookman on 6/10/16.
//  Copyright © 2016 Annette Brookman. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {


    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!


    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        
        textButton.frame.origin.y = 360
        photoButton.frame.origin.y = 360
        quoteButton.frame.origin.y = 360
        linkButton.frame.origin.y = 360
        chatButton.frame.origin.y = 360
        videoButton.frame.origin.y = 360
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.3) { () -> Void in
            
            self.textButton.frame.origin.y = 143
            self.photoButton.frame.origin.y = 143
            self.quoteButton.frame.origin.y = 143
            self.linkButton.frame.origin.y = 272
            self.chatButton.frame.origin.y = 272
            self.videoButton.frame.origin.y = 272
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapNevermind(sender: UIButton) {
    
        dismissViewControllerAnimated(true, completion: nil)
    
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
