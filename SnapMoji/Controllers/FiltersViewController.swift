//
//  FiltersViewController.swift
//  SnapMoji
//
//  Created by Josh Baltar on 2018-11-17.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {

    @IBAction func cancelButton_tap(_ sender: UIButton) {
        removeAnimate()
    }
    
    @IBAction func saveButton_tap(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimate()
        // Do any additional setup after loading the view.
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished : Bool) in
            if(finished)
            {
                self.willMove(toParentViewController: nil)
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
            }
        })
    }


}
