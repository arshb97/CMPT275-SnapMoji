//
//  PopUpViewController.swift
//
//
//  Created by Josh Baltar on 2018-10-28.
//

import UIKit

class PopUp_ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    //ib outlet weak var image dragged here (maybe prepare segue?)
    
    var fileName = "emotion.jpg"
    
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        // collectionView.dataSource = self
        //  collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        print("PopupView"+fileName)
    }

    @IBAction func gallery_tap(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            //after it is complete
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.dismiss(animated: true, completion: {
                /*
                //saves image in directory
                let imagePath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(fileName)"
                let imageUrl: URL = URL(fileURLWithPath: imagePath)
                let newImage: UIImage = image// create your UIImage here
                try? UIImagePNGRepresentation(newImage)?.write(to: imageUrl)
                 */
                
                print("SUCCESSFULLY SET IMAGE")
            })
        } else {
            print("ERROR COULD NOT SET IMAGE")
        }
        self.dismiss(animated:true, completion: nil)
    }
    
    @IBAction func openCamera_touchUpInside(_ sender: Any) {
        performSegue(withIdentifier: "openCamera_Segue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is CameraViewController
        {
            let vc = segue.destination as? CameraViewController
            vc?.fileName = fileName
        }
    }
    
    @IBAction func closePopup(_ sender: Any) {
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
