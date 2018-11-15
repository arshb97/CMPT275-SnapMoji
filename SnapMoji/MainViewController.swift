//
//  MainViewController.swift
//  SnapMoji
//
//  Created by Mirna Zaki on 2018-11-14.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

var firstInstall = true
//let emotions = ["happiness", "sadness", "angrer", "surprise", "disgust", "fear", "contempt", "neutral"]
let emotions = ["happiness"]

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Save sample images to coredata
        if(firstInstall){
            for Emotion in emotions {
                let image = UIImage(named: "Sample"+Emotion+".jpg")
                let imagePath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\("Sample"+Emotion+".jpg")"
                let imageUrl: URL = URL(fileURLWithPath: imagePath)
                let newImage: UIImage = image!// create your UIImage here
                try? UIImagePNGRepresentation(newImage)?.write(to: imageUrl)
            }
            firstInstall = false
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
