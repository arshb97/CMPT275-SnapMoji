//
//  DescriptionViewController.swift
//  SnapMoji
//  Worked on by: Merna Zaki
//
//  Changelog:
//  1.0 - Initial commit of UI and segues
//  2.0 - All buttons give proper descriptions/causes
//
//  Known bugs:
//
//
//  Created by zza92 on 11/22/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    var Emotion = ""

    
    //prepare emotion variable to send to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is EmotionDescriptionViewController
        {
            let vc = segue.destination as? EmotionDescriptionViewController
            vc?.EmotionLabel = self.Emotion
        }
    }
    
    //One of the 8 emotions (buttons) are pressed
  
    @IBAction func HappyPressed(_ sender: Any) {
        self.Emotion = "Happiness"
        performSegue(withIdentifier: "DescriptionSeg", sender: nil)
    }
    
    @IBAction func NeutralPressed(_ sender: Any) {
        self.Emotion = "Neutral"
        performSegue(withIdentifier: "DescriptionSeg", sender: nil)
    }
    @IBAction func ContemptPressed(_ sender: Any) {
        self.Emotion = "Contempt"
        performSegue(withIdentifier: "DescriptionSeg", sender: nil)
    }
    @IBAction func FearPressed(_ sender: Any) {
        self.Emotion = "Fear"
        performSegue(withIdentifier: "DescriptionSeg", sender: nil)
    }
    @IBAction func DisgustPressed(_ sender: Any) {
        self.Emotion = "Disgust"
        performSegue(withIdentifier: "DescriptionSeg", sender: nil)
    }
    @IBAction func SurprisedPressed(_ sender: Any) {
        self.Emotion = "Surprise"
        performSegue(withIdentifier: "DescriptionSeg", sender: nil)
    }
    @IBAction func AngryPressed(_ sender: Any) {
        self.Emotion = "Angry"
        performSegue(withIdentifier: "DescriptionSeg", sender: nil)
    }
    @IBAction func SadnessPressed(_ sender: Any) {
        self.Emotion = "Sadness"
        performSegue(withIdentifier: "DescriptionSeg", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
