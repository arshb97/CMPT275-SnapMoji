//
//  PreviewViewController.swift
//  SnapMoji
//
//
//  Worked on by: Josh Baltar, Arshdeep Bhullar, Merna Zaki
//
//  Changelog:
//  1.0 - Initial commit layout and segues finished
//  1.1 - Camera working and storing photos to phone and firebase
//  1.2 - Emotions passed through view controllers, Microsoft emotion API implemented
//
//  Known bugs:
//  There are no known bugs related to the PreviewViewController.swift
//
//  Created by Josh Baltar on 2018-10-28.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit
import Firebase

//global variable for the microsoft emotion api
var detector: DetectFace = DetectFace()

class PreviewViewController: UIViewController, UIApplicationDelegate{

    //variables to store to firebase
    var imageReference: StorageReference {
        return Storage.storage().reference().child("images")
    }
    
    //variables to prepare sending to the next view controller
    var emotion = "emotion"
    var fileName = ".jpg"
    var image: UIImage!
    
    //reference for the photo
    @IBOutlet weak var photo: UIImageView!
    
    //label to print emotion returned by API
    @IBOutlet weak var apiEmotionValue: UILabel!
//    [label setFont:[UIFont systemFontOfSize:35]]
    
    //load the image when page is loaded from the camera
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photo.image = self.image
        print("PreviewView"+fileName)
        var scannedEmotion = detector.detectAction(image)
    }
    
    //function to implement the save button
    @IBAction func savePhoto_tap(_ sender: UIButton) {
        // USE THIS IMAGE
        guard let imageToSave = image else { return }
        
        //uncomment this to upload to firebase
        /*
        //turn the image into data
        guard let imageData = UIImageJPEGRepresentation(image, 1) else { return }
        
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
        emotionResult = detector.globalVariableGetter()
        if emotionResult == emotion {
            let imagePath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(fileName)"
            let imageUrl: URL = URL(fileURLWithPath: imagePath)
            let newImage: UIImage = image// create your UIImage here
            try? UIImagePNGRepresentation(newImage)?.write(to: imageUrl)
        }
        
        //transition back to the library
        performSegue(withIdentifier: "showMojiLibrary_Segue", sender: nil)
        //dismiss(animated: true, completion: nil)
    }
    
    
/*downloading:
     
     let downloadImageRef = imageReference.child(fileName)
     let downloadtask = downloadImageRef.getData(maxSize: 1024*1024*12) { (data, error) in
     if let data = data {
     let image = UIImage(data: data)
     self.downloadImage.image = image
     
     }
     print(error ?? "NO ERROR")
     }
     
     downloadtask.observe(.progress) { (snapshot) in
     print(snapshot.progress ?? "NO MORE PROGRESS")
     }
     
     downloadtask.resume()
 */
    
    //I have used this print statement just for reference. API takes 1-2 seconds to return the result. The result will be displayed in console. Once you see that result, press Seeresults button
    //sends the image to the microsoft emotion api
//    @IBAction func detect(_ sender: Any) {
//        
//        var scannedEmotion = detector.detectAction(image)
//        print("emotion: " , scannedEmotion)
//    }
    
    //variable to store what the emotion returns
    var emotionResult = ""                  //Variable to store the emotion of the picture given by API
    
    //function to see results of the emotion api
    @IBAction func seeResults(_ sender: Any) {
        emotionResult = detector.globalVariableGetter()
        print (emotionResult)
        apiEmotionValue.text = emotionResult
        }
    
    // function to implement the cancel button
    @IBAction func cancelButton_tap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
