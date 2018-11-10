//
//  FriendSectionViewController.swift
//  SnapMoji
//
//  Created by Mirna Zaki on 2018-11-08.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit


class FriendSectionViewController:  UIViewController, UICollectionViewDelegate,
UICollectionViewDataSource {

    @IBOutlet weak var addFriend: UIButton!
    private var name = ""
    private var friends = ["Sample"]
    
    @IBOutlet weak var collection: UICollectionView!
    
    @IBAction func addFriend_tab(_ sender: Any) {
        let alertController = UIAlertController(title: "Add New Friend", message: "Type your friends name below", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.default, handler: { alert -> Void in
            let text = alertController.textFields![0] as UITextField
            self.name = text.text!
            if self.name == ""{
                // do something here to prevent user from exiting
            }
            print("NAME: ", self.name)
            self.friends.append(self.name)
            self.collection.reloadData()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize{
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("here")
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.friendName.text = friends[indexPath.row]
        let image = UIImage(named: "friends.png") as UIImage?
        cell.profileButton.setImage(image, for: [])
        return cell
    }
    
}
