//
//  ViewController.swift
//  SnapMoji
//
//  Created by Evan Lam on 10/26/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let friends = ["Tommy"]
    
    let friendImages: [UIImage] = [
        UIImage(named: "sadface")!
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
       // collectionView.dataSource = self
      //  collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.tommyLabel.text=friends[indexPath.item]
        cell.tommyProfile.image=friendImages[indexPath.item]
        return cell
    }

}

