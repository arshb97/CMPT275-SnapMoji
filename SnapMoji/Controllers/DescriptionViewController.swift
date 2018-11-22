//
//  DescriptionViewController.swift
//  SnapMoji
//
//  Created by zza92 on 11/22/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    
    @IBOutlet weak var HappinessButton: UIButton!
    
    
    //prepare emotion variable to send to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is EmotionDescriptionViewController
        {
            let vc = segue.destination as? EmotionDescriptionViewController
            vc?.EmotionLabel = "Happiness"
        }
    }
    
    @IBAction func HappinessPressed(_ sender: Any) {
        performSegue(withIdentifier: "DescriptionSeg", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
