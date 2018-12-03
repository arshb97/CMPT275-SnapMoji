//
//  EmotionDescriptionViewController.swift
//  SnapMoji
//
//  Worked on by: Merna Zaki
//
//  Changelog:
//  1.0 - Initial commit of UI and segues
//  2.0 - Retrieves descrtions/causes from firebase according to emotions pressed
//
//  Known bugs:
//  Cancel button does not reset the changes made by the filter
//
//  Created by Mirna Zaki on 11/22/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EmotionDescriptionViewController: UIViewController {
    
    var EmotionLabel = "" //title for the emotion
    
    //define outlets needed from the storyboard
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var causes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("EMOTION: "+EmotionLabel)
        
        //set the label of the page to the emotion
        Label.text = EmotionLabel
        
        //retrieve description and causes form firebase
        let ref = Database.database().reference()
        ref.child(EmotionLabel+"/Description").observeSingleEvent(of: .value) { (snapshot) in
            self.Description.text = snapshot.value as? String
        }
        ref.child(EmotionLabel+"/Causes").observeSingleEvent(of: .value) { (snapshot) in
            self.causes.text = snapshot.value as? String
        }
    }

}
