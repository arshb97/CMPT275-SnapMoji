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
    
    @IBOutlet weak var HappyMoji: UIImageView!
    
    @IBOutlet weak var HappyMojiButton: UIButton!
    
    @IBAction func HappyMoji_tap(_ sender: Any) {
        performSegue(withIdentifier: "libToPopUp_Segue", sender: nil)
    }
    
    let emotions = ["emotions.jpg", "sad.jpg", "angry.jpg", "surprise", "disgust", "fear", "contempt", "neutral"]
    

    
    func goToImageChooserClass() {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVController = mainStoryBoard.instantiateViewController(withIdentifier: "PopUp_ViewController") as! PopUp_ViewController
        secondVController.libVController = self
        self.present(secondVController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        // collectionView.dataSource = self
        //  collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        //HappyMojiButton.setImage(image, for: .normal)
        //get image
        //print("LOADED LIBRARY")
        for emotion in emotions {
            let fileName = emotion
            let imagePath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(fileName)"
            let imageUrl: URL = URL(fileURLWithPath: imagePath)
            
            guard FileManager.default.fileExists(atPath: imagePath),
                let imageData: Data = try? Data(contentsOf: imageUrl),
                let image: UIImage = UIImage(data: imageData) else {
                    return // No image found!
            }
            
            // check if the image is stored already
            if FileManager.default.fileExists(atPath: imagePath),
                let imageData: Data = try? Data(contentsOf: imageUrl),
                let image: UIImage = UIImage(data: imageData, scale: UIScreen.main.scale) {
                HappyMojiButton.setImage(image, for: .normal)
                print("PHOTO EXISTS")
            }
        }
        /*
        if FileManager.default.fileExists(atPath: imagePath) {
            HappyMojiButton.setImage(UIImage(named: fileName), for: .normal)
            print("LOADED PHOTO")
        }
         */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
