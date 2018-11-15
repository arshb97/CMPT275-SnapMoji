//
//  LibraryViewController.swift
//  SnapMoji
//
//  Description of LibraryViewController:
//  This file has not been implemented yet, but is for the display of the friends in the
//  friend section
//
//  Worked on by: Josh Baltar, Merna Zaki
//
//  Changelog:
//  1.0 - Initial commit layout and segues finished
//  1.1 - Camera working and storing photos to phone and firebase
//  1.2 - Emotions passed through view controllers, Microsoft emotion API implemented
//
//  Known bugs:
//  No warning as to when an emoji is not replaced when an image is selected
//  Gallery does not save the photo
//
//  Created by Josh Baltar on 2018-11-02.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit
import FirebaseDatabase

class LibraryViewController: UIViewController{

    
    //@IBOutlet weak var HappyMojiButton: UIButton!
    
    
    @IBOutlet weak var FriendName: UITextField!
    
    var setEmotion = "emotion"
    
    //buttons initialized
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
    
    //prepare emotion variable to send to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is PopUpViewController
        {
            let vc = segue.destination as? PopUpViewController
            vc?.emotion = setEmotion
            vc?.fileName = self.FriendName.text! + setEmotion + ".jpg"
        }
    }
    
    //array of supported emotions by SnapMoji defined by the emotions supported by the
    //Microsoft Emotion API
    let emotions = ["happiness", "sadness", "angrer", "surprise", "disgust", "fear", "contempt", "neutral"]
    
    //to let other classes access members of this class
    /*
    func goToImageChooserClass() {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVController = mainStoryBoard.instantiateViewController(withIdentifier: "PopUp_ViewController") as! PopUp_ViewController
        secondVController.libVController = self
        self.present(secondVController, animated: true, completion: nil)
    }
    */
    

    //while view loads, load photos of emotions if they exist
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        // collectionView.dataSource = self
        //  collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        //Change the label to the name of the friend (name retrieved from firebase)
        let ref = Database.database().reference()
        ref.child("currentFriend/name").observeSingleEvent(of: .value) { (snapshot) in
            self.FriendName.text = snapshot.value as? String
        }
        
        print("LOADED LIBRARY")
        //get image
        for emotion in emotions {
            let fileName = emotion + ".jpg"
            let imagePath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(fileName)"
            let imageUrl: URL = URL(fileURLWithPath: imagePath)
            
            // check if the image is stored already
            if FileManager.default.fileExists(atPath: imagePath),
                let imageData: Data = try? Data(contentsOf: imageUrl),
                let image: UIImage = UIImage(data: imageData, scale: UIScreen.main.scale) {
                //figure out how to change which moji button we are changing
                let rotatedImage = image.rotate(radians: .pi / 2)
                switch fileName {
                    case self.FriendName.text!+"happiness.jpg":
                    HappyMojiButton.setImage(rotatedImage, for: .normal)
                    print("Image set for " + fileName)
                    case self.FriendName.text!+"sadness.jpg":
                    SadMojiButton.setImage(rotatedImage, for: .normal)
                    print("Image set for " + fileName)
                    case self.FriendName.text!+"anger.jpg":
                    AngryMojiButton.setImage(rotatedImage, for: .normal)
                    print("Image set for " + fileName)
                    case self.FriendName.text!+"surprise.jpg":
                    SurpriseMojiButton.setImage(rotatedImage, for: .normal)
                    print("Image set for " + fileName)
                    case self.FriendName.text!+"disgust.jpg":
                    DisgustMojiButton.setImage(rotatedImage, for: .normal)
                    print("Image set for " + fileName)
                    case self.FriendName.text!+"fear.jpg":
                    FearMojiButton.setImage(rotatedImage, for: .normal)
                    print("Image set for " + fileName)
                    case self.FriendName.text!+"contempt.jpg":
                    ContemptMojiButton.setImage(rotatedImage, for: .normal)
                    print("Image set for " + fileName)
                    case self.FriendName.text!+"neutral.jpg":
                    NeutralMojiButton.setImage(rotatedImage, for: .normal)
                    print("Image set for " + fileName)
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

//extension of emoji UIImage to rotate on load
//rotate necessary when saving as jpg since rotate flag is set when stored
extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.x, y: -origin.y,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return rotatedImage ?? self
        }
        
        return self
    }
}

