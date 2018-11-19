//
//  TestSettingViewController.swift
//  SnapMoji
//
//  Worked on by: Josh Baltar
//
//  Changelog:
//  1.0 - Initial commit layout and segues finished
//  2.0 - Difficulty buttons replaced with DLRadio buttons
//  2.1 - Difficulty setting implemented
//  2.2 - Filter setting implemented
//
//  Known bugs:
//  No known bugs for this controller
//
//  Created by zza92 on 2018-11-08.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class TestSettingViewController: UIViewController {
    
    //* difficulty code *//
    //easy, medium, hard buttons to set difficulty
    @IBOutlet weak var easyMode: UIButton!
    @IBOutlet weak var mediumMode: UIButton!
    @IBOutlet weak var hardMode: UIButton!
    
    //function to set difficulty with easy, med, hard buttons
    @IBAction func setDifficulty(_ sender: UIButton) {
        difficulty = sender.tag
        print("Difficulty set to " , difficulty)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Starts the test with the selected filters/difficulties
    @IBAction func startTest_tap(_ sender: UIButton) {
        performSegue(withIdentifier: "startTest_Segue", sender: nil)
    }
    
    @IBAction func filterFriends_tap(_ sender: UIButton) {
        //performSegue(withIdentifier: "filterView_Segue", sender: nil)
        let filterVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "filter_ViewController") as! FiltersViewController
        
        self.addChildViewController(filterVC)
        
        filterVC.view.frame = self.view.frame
        
        self.view.addSubview(filterVC.view)
        
        filterVC.didMove(toParentViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
