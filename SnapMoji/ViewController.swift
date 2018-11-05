//
//  ViewController.swift
//  SnapMoji
//  Worked on by: Josh Baltar, Jiung Choi, Merna Zaki
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

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //var friends is unused, used possibly for future versions
    let friends = ["Tommy"]
    //var friends is unused, used possibly for future versions
    let friendImages: [UIImage] = [
        UIImage(named: "sadface")!
    ]
    

    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
       // collectionView.dataSource = self
      //  collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //this is unused, used possibly for future versions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
        
    }
    //this is unused, used possibly for future versions
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.tommyLabel.text=friends[indexPath.item]
        cell.tommyProfile.image=friendImages[indexPath.item]
        return cell
    }

}

