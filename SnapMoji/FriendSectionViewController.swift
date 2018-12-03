//
//  FriendSectionViewController.swift
//  SnapMoji - Team 10 
//
//  Created by Mirna Zaki on 2018-11-08.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//
//  Description of FriendSectionViewController:
//  holds a collection of friends, allows the user to add more friends and access their pages
//
//
//  Worked on by: Merna Zaki
//
//
//  Changelog:
//  1.0 - This is the initial commit of our view controller
//  2.0 - Pop-up added for the add friend button
//  3.0 - collection view added and working (can now add a new friend)
//
//  Known bugs:
//  there are no known bugs


import UIKit

public var friends = ["Sample"] //array of friends

class FriendSectionViewController:  UIViewController, UICollectionViewDelegate,
UICollectionViewDataSource {
    
    //outlet defined from the storyboard
    @IBOutlet weak var addFriend: UIButton!
    //name left empty to be filled in when the friend is selected
    private var name = ""
    
    //using a collection view for each friend in the friends section
    @IBOutlet weak var collection: UICollectionView!
    
    //when the "add friend" icon is tapped bring up a text field to enter a name
    @IBAction func addFriend_tab(_ sender: Any) {
        //create popup
        let alertController = UIAlertController(title: "Add New Friend", message: "Type your friends name below", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Name"
        }
        //save button
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.default, handler: { alert -> Void in
            let text = alertController.textFields![0] as UITextField //extract users input
            self.name = text.text!
            if self.name != ""{
                print("NAME: ", self.name)
                friends.append(self.name) //save the users input
                self.collection.reloadData()
            }
        })
        //cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        //add the save and cancel buttons to the popup
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }

    //when a person is selected print
    @objc private func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

//Extension for Collection View
extension FriendSectionViewController {
    
    //find size of friends
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
    }
    
    //add one cell per friend
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.friendName.text = friends[indexPath.row]
        let image = UIImage(named: "friends.png") as UIImage?
        cell.profileButton.setImage(image, for: [])
        return cell
    }
    
}
