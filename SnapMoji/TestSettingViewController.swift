//
//  TestSettingViewController.swift
//  SnapMoji
//
//  Created by zza92 on 2018-11-08.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class TestSettingViewController: UIViewController {
    var isOn = false
    
    @IBAction func EASY(_ sender: UIButton) {
        isOn = !isOn
        if isOn{
            sender.setTitleColor(UIColor(red:0.00, green:0.47, blue:0.75, alpha:1.0), for: .normal)
            sender.backgroundColor = UIColor.white
        }
        else{
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.backgroundColor = .clear
        }
        
        
    }
    
    @IBAction func MEDIUM(_ sender: UIButton) {
        isOn = !isOn
        if isOn{
            sender.setTitleColor(UIColor(red:0.00, green:0.47, blue:0.75, alpha:1.0), for: .normal)
            sender.backgroundColor = UIColor.white
        }
        else{
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.backgroundColor = .clear
        }
        
        
    }
    
    
    @IBAction func HARD(_ sender: UIButton) {
        isOn = !isOn
        if isOn{
            sender.setTitleColor(UIColor(red:0.00, green:0.47, blue:0.75, alpha:1.0), for: .normal)
            sender.backgroundColor = UIColor.white
        }
        else{
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.backgroundColor = .clear
        }
        
    }
    
    @IBAction func DESCRIPTION(_ sender: UIButton) {
        isOn = !isOn
        if isOn{
            sender.setTitleColor(UIColor(red:0.00, green:0.47, blue:0.75, alpha:1.0), for: .normal)
            sender.backgroundColor = UIColor.white
        }
        else{
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.backgroundColor = .clear
        }
        
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
