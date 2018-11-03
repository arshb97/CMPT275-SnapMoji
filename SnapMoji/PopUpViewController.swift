//
//  PopUpViewController.swift
//
//
//  Created by Josh Baltar on 2018-10-28.
//

import UIKit

class PopUp_ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    //ib outlet weak var image dragged here (maybe prepare segue?)
    
    var libVController: LibraryViewController! //object representing ViewController for emojis
    
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        // collectionView.dataSource = self
        //  collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
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
                print("SUCCESSFULLY SET IMAGE")
                //let imageV: UIImageView = UIImageView(image: image)
                //imageV.frame = CGRect(origin: CGPoint(x: 0,y: 0), size: CGSize(width: image.size.width, height: image.size.height))
            
                //imageView.center = self.view.center
                //self.libVController.HappyMojiButton.setImage(image, for: .normal)
            })//HappyMoji.image = image
        } else {
            print("ERROR COULD NOT SET IMAGE")
        }
        self.dismiss(animated:true, completion: nil)
    }
    
    @IBAction func openCamera_touchUpInside(_ sender: Any) {
        performSegue(withIdentifier: "openCamera_Segue", sender: nil)
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
