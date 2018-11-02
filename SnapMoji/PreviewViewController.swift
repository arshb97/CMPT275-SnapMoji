//
//  PreviewViewController.swift
//  SnapMoji
//
//  Created by Josh Baltar on 2018-10-28.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit
import Photos
import Firebase

class PreviewViewController: UIViewController {

    
    var image: UIImage!
    
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photo.image = self.image
        
        /*
        //writing directory for image:
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        //name image
        let fileName = "emotion.jpg"
        
        //create destination file url:
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        //get UIImage jpeg data and check if the desination file already exists
        if let data = UIImageJPEGRepresentation(image, 1.0),
            !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                //writes the image data to disk
                try data.write(to: fileURL)
                print("file saved")
            } catch {
                print("error saving file:", error)
            }
        }
        */
        
        //setup storing photo for firebase
        // Points to the root reference
   
        
        
        
        
    }
    

    @IBAction func savePhoto_tap(_ sender: UIButton) {
        guard let imageToSave = image else {
            return
        }
        
        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        dismiss(animated: true, completion: nil)
    }
    
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
