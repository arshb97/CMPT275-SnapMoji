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
//  - when submitting nothing (pressing the save button, it will take it as a name
//  - Not connected to firebase: added friends are not saved when you exist the page


import UIKit

public var friends = ["Sample"] //array of friends

class FriendSectionViewController:  UIViewController, UICollectionViewDelegate,
UICollectionViewDataSource {

    @IBOutlet weak var addFriend: UIButton!
    private var name = ""
    
    @IBOutlet weak var collection: UICollectionView!
    
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
            if self.name == ""{
                // do something here to prevent user from exiting
            }
            print("NAME: ", self.name)
            friends.append(self.name) //save the users input
            self.collection.reloadData()
        })
        //cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        //add the save and cancel buttons to the popup
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }

    @objc private func buttonAction(sender: UIButton!) {
        print("Button tapped")
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

extension FriendSectionViewController {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize{
//        return CGSize(width: 100, height: 100)
//    }
    
    //find size of friends
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("here")
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
