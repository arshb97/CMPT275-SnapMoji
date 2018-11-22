//
//  CollectionViewCell.swift
//  SnapMoji - Team 10 
//
//  Description of CollectionViewCell:
//  Contains a button and a label for each friend that is created in the friend seciton
//
//
//  Worked on by: Jiung Choi, Merna Zaki
//
//
//  Changelog:
//  1.0 - This is the initial commit of our view controller
//  2.0 - added the items in the cell for the collection view
//  2.1 - Implmented the friend button (saving the name of the friend to firebase)
//
//  Known bugs:
//  There are no known bugs related to the ViewController.swift
//
//  Created by Jiung Choi on 10/26/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileButton: UIButton! //Button with a proile pitcure
    @IBOutlet weak var friendName: UILabel! //label containing the friends name
    
    @IBAction func FriendButton_tab(_ sender: Any) {
    //send the name of the friend pressed to Firebase
     let ref = Database.database().reference()
     ref.child("currentFriend/name").setValue(self.friendName.text)
     print("NAME PRESSED: ", self.friendName.text ?? "")
    }
    
}
