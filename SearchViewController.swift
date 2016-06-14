//
//  SearchViewController.swift
//  AB_HW_Week4_v1
//
//  Created by Annette Brookman on 6/10/16.
//  Copyright © 2016 Annette Brookman. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    
    @IBOutlet weak var searchfeedImageView: UIImageView!
    
    @IBOutlet weak var animContainerView: UIImageView!
    
    var images: [UIImage]!
    var animatedImage: UIImage!

    override func viewWillAppear(animated: Bool) {
        
        self.searchfeedImageView.alpha = 0
        self.animContainerView.alpha = 1
    
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Delay for 2 seconds, then run the code between the braces.
        delay(0.5) {
          
            self.searchfeedImageView.alpha = 1
            self.animContainerView.alpha = 0
        
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        
        images = [loading_1, loading_2, loading_3]
        
        animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)

        animContainerView.image = animatedImage

           }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
