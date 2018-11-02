//
//  PopUpViewController.swift
//
//
//  Created by Josh Baltar on 2018-10-28.
//

import UIKit

class PopUp_ViewController: UIViewController {
    
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        // collectionView.dataSource = self
        //  collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
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
