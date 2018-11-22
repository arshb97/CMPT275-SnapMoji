//
//  EmotionDescriptionViewController.swift
//  SnapMoji
//
//  Created by Mirna Zaki on 11/22/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EmotionDescriptionViewController: UIViewController {
    
    var EmotionLabel = ""
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var causes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
