//
//  LocationController.swift
//  hackTest2
//
//  Created by Thomas jordan on 2017-03-11.
//  Copyright © 2017 Thomas jordan. All rights reserved.
//

import UIKit
import MapKit




class LocationController:  UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    

  
    @IBOutlet weak var locMap: MKMapView!
    @IBOutlet weak var locLbl: UILabel!
    @IBOutlet weak var locTxtVew: UITextView!
    @IBOutlet weak var switchMT: UISegmentedControl!
    @IBOutlet weak var locImg: UIImageView!
    @IBOutlet weak var tv: UITableView!
    
    
    override func viewDidAppear(_ animated: Bool) {
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         tv.separatorInset = UIEdgeInsetsMake(5, 3, 5, 11);
        
        
     tv.isHidden = true

        locImg.layer.cornerRadius = 5
       locTxtVew.layer.cornerRadius = 5

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
      
        
    }
    
    @IBAction func switchPressed(_ sender: Any) {
        if (tv.isHidden == true){
            tv.isHidden = false
            locMap.isHidden = true
        }else if (locMap.isHidden == true){
            tv.isHidden = true
            locMap.isHidden = false
        }
        
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "new stuff"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.darkGray.withAlphaComponent(0.40)
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.gray.withAlphaComponent(1.0).cgColor
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        
        
        
        cell.layer.masksToBounds = true
        //
        return cell
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
