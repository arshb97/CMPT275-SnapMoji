//
//  PreviewViewController.swift
//  SnapMoji
//
//  Created by Josh Baltar on 2018-10-28.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    
    var image: UIImage!
    
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photo.image = self.image
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
