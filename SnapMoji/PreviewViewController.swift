//
//  PreviewViewController.swift
//  SnapMoji
//
//  Created by Josh Baltar on 2018-10-28.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit
import Firebase

class PreviewViewController: UIViewController, UIApplicationDelegate{

    var imageReference: StorageReference {
        return Storage.storage().reference().child("images")
    }
    
    let fileName = "emotions.jpg"
    
    var image: UIImage!
    
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photo.image = self.image
    }
    

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
        
        
        let imagePath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(fileName)"
        let imageUrl: URL = URL(fileURLWithPath: imagePath)
        let newImage: UIImage = image// create your UIImage here
            try? UIImagePNGRepresentation(newImage)?.write(to: imageUrl)
        
        guard FileManager.default.fileExists(atPath: imagePath),
            let imageData: Data = try? Data(contentsOf: imageUrl),
            let image: UIImage = UIImage(data: imageData) else {
                return // No image found!
        }
        if FileManager.default.fileExists(atPath: imagePath) {
            ViewController.HappyMoji.image = image
        }
        
        
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
    
    
    @IBAction func cancelButton_tap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vController = segue.destination as? ViewController else { return }
        
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
