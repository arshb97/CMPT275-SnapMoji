//
//  PopUpViewController.swift
//  SnapMoji
//
//  Created by Jiung Choi on 10/29/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
