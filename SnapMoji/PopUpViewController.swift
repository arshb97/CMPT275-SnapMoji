//
//  PopUpViewController.swift
//
//
//
//  Worked on by: Josh Baltar, Jiung Choi
//
//  Changelog:
//  1.0 - Initial commit layout and segues finished
//  1.1 - Emotions passed through view controllers, gallery support implemented, but doesn't save photo
//
//  Known bugs:
//  Gallery does not save image when an image is selected
//
//  Created by Josh Baltar on 2018-10-28.
//

import UIKit

class PopUpViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    //ib outlet weak var image dragged here (maybe         repare segue?)
    
    //Variables to be passed to other view controllers initialized
    var emotion = "emotion"
    var fileName = ".jpg"

    //output current emotion
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        // collectionView.dataSource = self
        //  collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        print("PopupView"+fileName)
        
    }
    
    //function to open gallery when clicked
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
    
    //function to save the photo that gets clicked
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
    
    //function to open the camera when tapped
    @IBAction func openCamera_touchUpInside(_ sender: Any) {
        performSegue(withIdentifier: "openCamera_Segue", sender: nil)
    }
    
    //prepares variables to be sent to other view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is CameraViewController
        {
            let popUpViewController = segue.destination as? CameraViewController
            popUpViewController?.emotion = emotion
            popUpViewController?.fileName = fileName
        }
    }
    
    //function to close the view when tapping cancel button
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
