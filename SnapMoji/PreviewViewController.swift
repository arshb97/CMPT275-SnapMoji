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
        photo.image = self.image
        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelButton_touchUpInside(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton_touchUpInside(_ sender: UIButton) {
        //saves to iphone's photo album
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
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
