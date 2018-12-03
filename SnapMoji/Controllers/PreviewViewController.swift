//
//  PreviewViewController.swift
//  SnapMoji - Team 10 
//
//
//  Worked on by: Josh Baltar, Arshdeep Bhullar, Merna Zaki
//
//  Changelog:
//  1.0 - Initial commit layout and segues finished
//  1.1 - Camera working and storing photos to phone and firebase
//  1.2 - Emotions passed through view controllers, Microsoft emotion API implemented
//  2.0 - Gallery now sends the image to this view to approve with the MS emotion API
//  2.1 - Emotion is displayed on the screen when submitted
//
//  Known bugs:
//  Preview crops the image to accomodate screen size when sent from the gallery
//
//
//  Created by Josh Baltar on 2018-10-28.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit
import Firebase

//global variable for the microsoft emotion api
var detector: DetectFace = DetectFace()

class PreviewViewController: UIViewController, UIApplicationDelegate{

    //  variables to store to firebase
    var imageReference: StorageReference {
        return Storage.storage().reference().child("images")
    }

    
    //variables to prepare sending to the next view controller
    var emotion = "emotion"
    var fileName = ".jpg"
    var image: UIImage!
    var fromGallery = false
    
    //reference for the photo
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var apiEmotionValue: UILabel!
    
    //load the image when page is loaded from the camera
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        photo.image = self.image
        print("PreviewView " + fileName)
        
        var _ = detector.detectAction(image)
        getEmotion()
    }
    
    //function to implement the save button
    @IBAction func savePhoto_tap(_ sender: UIButton) {
        // USE THIS IMAGE
        guard let imageToSave = image else { return }
        
        //turn the image into data
        guard let imageData = UIImageJPEGRepresentation(image, 1) else { return }
        
        /*
        let uploadImageRef = imageReference.child(fileName)
        
        let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
            print("UPLOAD TASK FINISHED")
            print (metadata ?? "NO METADATA")
            print (error ?? "NO ERROR")
        }
        
        //for potential upload indicator:
        uploadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress ?? "NO MORE PROGRESS")
        }
        
        uploadTask.resume()
        */
        
        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        
        //saves image in directory
        //emotionResult = detector.globalVariableGetter()
        print(emotionResult + " IMAGE")
        print("Saving file as " + fileName)
        if emotionResult == emotion {
            let imagePath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(fileName)"
            let imageUrl: URL = URL(fileURLWithPath: imagePath)
            if fromGallery {
                let newImage: UIImage = image.rotate(radians: 0)// create your UIImage here
                try? UIImagePNGRepresentation(newImage)?.write(to: imageUrl)
            } else {
                let newImage: UIImage = image.rotate(radians: 0)// create your UIImage here
                try? UIImagePNGRepresentation(newImage)?.write(to: imageUrl)
            }
        }
        
        //transition back to the library
        performSegue(withIdentifier: "showMojiLibrary_Segue", sender: nil)
        //dismiss(animated: true, completion: nil)
    }
    
    
    //I have used this print statement just for reference. API takes 1-2 seconds to return the result. The result will be displayed in console. Once you see that result, press Seeresults button
    //sends the image to the microsoft emotion api
//    @IBAction func detect(_ sender: Any) {
//        
//        var scannedEmotion = detector.detectAction(image)
//        print("emotion: " , scannedEmotion)
//    }
    
    //variable to store what the emotion returns
    var emotionResult = ""                  //Variable to store the emotion of the picture given by API
    
    // function to implement the cancel button
    @IBAction func cancelButton_tap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
 
    func getEmotion() {
        print (emotionResult + "waiting until show emotion\n\n\n")
        
        //execute code with a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.showEmotion()
        })
        
    }
    
    func showEmotion() {
        emotionResult = detector.globalVariableGetter()
        print (emotionResult + "waiting until show emotion 2 \n\n\n")
        apiEmotionValue.text = emotionResult
        if emotionResult == emotion {
            apiEmotionValue.textColor = UIColor.green
        } else {
            apiEmotionValue.textColor = UIColor.red
        }
    }

}
