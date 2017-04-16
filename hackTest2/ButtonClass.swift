//
//  ButtonClass.swift
//  hackTest2
//
//  Created by Thomas jordan on 2017-03-11.
//  Copyright © 2017 Thomas jordan. All rights reserved.
//

import UIKit

class ButtonClass: UIButton {
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
       //self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 10
        
        
        
        //let image = UIImage(named: "events.jpg")
        
        
       // self.setImage(image, for: .normal)
        
        
        
        self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.75)
            
        
        
       
        
        
    }

}
