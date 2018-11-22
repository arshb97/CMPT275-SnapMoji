//
//  CheckBox.swift
//  SnapMoji - Team 10 
//
//
//  Worked on by: Josh Baltar
//
//  Changelog:
//  1.0 - Initial commit of variables and images
//  2.0 - This class is now depricated and will be removed in a future version
//
//  Known bugs:
//  No known bugs for this class
//
//  Created by Josh Baltar on 2018-11-17.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import Foundation
class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "ButtonClicked")! as UIImage
    let uncheckedImage = UIImage(named: "ButtonUnclicked")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControlState.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControlState.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
