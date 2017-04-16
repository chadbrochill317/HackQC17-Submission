//
//  MenuViewController.swift
//  hackTest2
//
//  Created by Thomas jordan on 2017-03-11.
//  Copyright © 2017 Thomas jordan. All rights reserved.
//

import UIKit
import ImageSlideshow


class MenuViewController: UIViewController {
    let singletonModel = Model.sharedInstance

    
    @IBOutlet weak var slideShow: ImageSlideshow!
     var slideshowTransitioningDelegate: ZoomAnimatedTransitioningDelegate?
    
    let localSource = [ImageSource(imageString: "E1")!, ImageSource(imageString: "E2")!]

    @IBAction func buttonPressed(_ sender: AnyObject) {
         let active = sender.tag
        
        if (active == 1){
            performSegue(withIdentifier: "myLocation", sender: self)
        }
        else if (active == 2){
            singletonModel.switchNum = 0
            performSegue(withIdentifier: "favorite", sender: self)
        }
        else if (active == 3){
            singletonModel.switchNum = 1
            performSegue(withIdentifier: "favorite", sender: self)
        }
        else if (active == 4){
            performSegue(withIdentifier: "detailPark", sender: self)

        }
    }
    
   
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

        
        slideShow.backgroundColor = UIColor.white
        slideShow.slideshowInterval = 5.0
        slideShow.pageControlPosition = PageControlPosition.insideScrollView
        slideShow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray;
        slideShow.pageControl.pageIndicatorTintColor = UIColor.black;
        slideShow.contentScaleMode = UIViewContentMode.scaleAspectFill
        slideShow.layer.cornerRadius = 10
        slideShow.backgroundColor = UIColor.blue.withAlphaComponent(0.15)
        slideShow.setImageInputs(localSource)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
