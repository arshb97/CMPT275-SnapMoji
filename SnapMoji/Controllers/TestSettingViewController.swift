//
//  TestSettingViewController.swift
//  SnapMoji
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
    
    //* filter code *//
    //hidden popup view
    //private var filterView: UIView! // attempt 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // hide filterView on load
        //filterView.isHidden = true //attempt 1
        //() //attempt 2
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
    
    /* //attempt 1
    @IBAction func filterFriends_tap(_ sender: UIButton) {
        loadFilterViewIntoController()
    }

    //load the view
    private func loadFilterViewIntoController() {
        let filterViewFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 200)
        filterView = UIView(frame: filterViewFrame)
        
        view.addSubview(filterView)
        
        filterView.isHidden = false
        
        //all other objects should be tied to this view as superView
        //ie this okayButton
        
        let okayButtonFrame = CGRect(x: 40, y: 100, width: 50, height: 50)
        let okayButton = UIButton(frame: okayButtonFrame)
        
        //adding the button its superView
        filterView.addSubview(okayButton)
        okayButton.addTarget(self, action: #selector(self.didPressButtonFromFilterView), for: .touchUpInside)
    }
    
   
    @objc func didPressButtonFromFilterView(sender: UIButton) {
        //do stuff
        //make view disappear again, or remove from its superview
        filterView.isHidden = true
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FiltersViewController
        {
            
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
