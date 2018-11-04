//
//  LibraryViewController.swift
//  SnapMoji
//
//  Created by Josh Baltar on 2018-11-02.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController{

    
    //@IBOutlet weak var HappyMojiButton: UIButton!
    
    var setEmotion = "emotion"

    @IBOutlet weak var HappyMojiButton: UIButton!
    @IBOutlet weak var SadMojiButton: UIButton!
    @IBOutlet weak var AngryMojiButton: UIButton!
    @IBOutlet weak var SurpriseMojiButton: UIButton!
    @IBOutlet weak var DisgustMojiButton: UIButton!
    @IBOutlet weak var FearMojiButton: UIButton!
    @IBOutlet weak var ContemptMojiButton: UIButton!
    @IBOutlet weak var NeutralMojiButton: UIButton!
    
    @IBAction func HappyMoji_tap(_ sender: Any) {
        setEmotion = emotions[0]
        performSegue(withIdentifier: "libToPopUp_Segue", sender: nil)
    }
    
    @IBAction func SadMoji_tap(_ sender: Any) {
        setEmotion = emotions[0]
        performSegue(withIdentifier: "libToPopUp_Segue", sender: nil)
    }
    @IBAction func AngryMoji_tap(_ sender: Any) {
        setEmotion = emotions[1]
        performSegue(withIdentifier: "libToPopUp_Segue", sender: nil)
    }
    @IBAction func SurpriseMoji_tap(_ sender: Any) {
        setEmotion = emotions[2]
        performSegue(withIdentifier: "libToPopUp_Segue", sender: nil)
    }
    @IBAction func DisgustMoji_tap(_ sender: Any) {
        setEmotion = emotions[3]
        performSegue(withIdentifier: "libToPopUp_Segue", sender: nil)
    }
    
    @IBAction func FearMoji_tap(_ sender: Any) {
        setEmotion = emotions[4]
        performSegue(withIdentifier: "libToPopUp_Segue", sender: nil)
    }
    @IBAction func ContemptMoji_tap(_ sender: Any) {
        setEmotion = emotions[5]
        performSegue(withIdentifier: "libToPopUp_Segue", sender: nil)
    }
    @IBAction func NeutralMoji_tap(_ sender: Any) {
        setEmotion = emotions[6]
        performSegue(withIdentifier: "libToPopUp_Segue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is PopUp_ViewController
        {
            let vc = segue.destination as? PopUp_ViewController
            vc?.fileName = setEmotion
        }
    }
    
    let emotions = ["happy.jpg", "sad.jpg", "angry.jpg", "surprise.jpg", "disgust.jpg", "fear.jpg", "contempt.jpg", "neutral.jpg"]
    
    //to let other classes access members of this class
    /*
    func goToImageChooserClass() {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVController = mainStoryBoard.instantiateViewController(withIdentifier: "PopUp_ViewController") as! PopUp_ViewController
        secondVController.libVController = self
        self.present(secondVController, animated: true, completion: nil)
    }
    */
    

    
    
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        // collectionView.dataSource = self
        //  collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        print("LOADED LIBRARY")
        //get image
        for emotion in emotions {
            let fileName = emotion
            let imagePath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(fileName)"
            let imageUrl: URL = URL(fileURLWithPath: imagePath)
            
            // check if the image is stored already
            if FileManager.default.fileExists(atPath: imagePath),
                let imageData: Data = try? Data(contentsOf: imageUrl),
                let image: UIImage = UIImage(data: imageData, scale: UIScreen.main.scale) {
                //figure out how to change which moji button we are changing
                switch fileName {
                    case "happy.jpg":
                    HappyMojiButton.setImage(image, for: .normal)
                    case "sad.jpg":
                    SadMojiButton.setImage(image, for: .normal)
                    case "angry.jpg":
                    AngryMojiButton.setImage(image, for: .normal)
                    case "surprise.jpg":
                    SurpriseMojiButton.setImage(image, for: .normal)
                    case "disgust.jpg":
                    DisgustMojiButton.setImage(image, for: .normal)
                    case "fear.jpg":
                    FearMojiButton.setImage(image, for: .normal)
                    case "contempt.jpg":
                    ContemptMojiButton.setImage(image, for: .normal)
                    case "neutral.jpg":
                    NeutralMojiButton.setImage(image, for: .normal)
                    default:
                    print("NO IMAGE AVAILABLE FOR " + fileName)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
