//
//  FriendSectionViewController.swift
//  SnapMoji
//
//  Created by Mirna Zaki on 2018-11-08.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit


class FriendSectionViewController: UIViewController {
    
    
    @IBOutlet weak var addFriend: UIButton!
    
    @IBAction func addFriend_tab(_ sender: Any) {
        let alert = UIAlertController(title: "Add Friend", message: "Please type the name of your friend", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.default, handler: nil))
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Type name here"
            textField.isSecureTextEntry = true // for password input
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
