//
//  TestSettingViewController.swift
//  SnapMoji
//
//  Created by zza92 on 2018-11-08.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class TestSettingViewController: UIViewController {
    
    //var difficulty = 0
    
    
    @IBOutlet weak var easyMode: UIButton!
    
    @IBOutlet weak var mediumMode: UIButton!
    
    @IBOutlet weak var hardMode: UIButton!
    
    
    @IBAction func setDifficulty(_ sender: UIButton) {
        difficulty = sender.tag
        print("Difficulty set to " , difficulty)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func startTest_tap(_ sender: UIButton) {
        performSegue(withIdentifier: "startTest_Segue", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is TestingViewController
        {
            //let vc = segue.destination as? TestingViewController
            //vc?.difficulty = difficulty
            print("Sending difficulty ", difficulty, " to test")
        }
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
