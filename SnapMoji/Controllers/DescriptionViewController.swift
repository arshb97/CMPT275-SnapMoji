//
//  DescriptionViewController.swift
//  SnapMoji
//
//  Created by zza92 on 11/22/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    var Emotion = ""
    
    
    @IBOutlet weak var HappinessButton: UIButton!
    @IBOutlet weak var NeutralButton: UIButton!
    @IBOutlet weak var ContemptButton: UIButton!
    @IBOutlet weak var FearButton: UIButton!
    @IBOutlet weak var DisgustButton: UIButton!
    @IBOutlet weak var SurpriseButton: UIButton!
    @IBOutlet weak var AngryButton: UIButton!
    @IBOutlet weak var SadnessButton: UIButton!
    
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
    @IBAction func HappinessPressed(_ sender: Any) {
        self.Emotion = "Happiness"
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
