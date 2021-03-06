//
//  ViewController.swift
//  SnapMoji - Team 10 
//  Worked on by: Josh Baltar, Jiung Choi, Merna Zaki
//
//  Description of ViewController.swift:
//  Main pages controlled by segues leading to the main pages. 
//
//  Changelog:
//  1.0 - This is the initial commit of our view controller
//
//  Known bugs:
//  There are no known bugs related to the ViewController.swift
//
//  Created by Evan Lam on 10/26/18.
//  Worked on by: Josh Baltar, Jon Zhang, Arshdeep
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

