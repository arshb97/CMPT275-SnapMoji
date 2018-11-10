//
//  FriendSectionViewController.swift
//  SnapMoji
//  Description of LibraryViewController:
//  For the display of the friends in the friend section
//
//  Worked on by: Merna Zaki
//
//  Changelog:
//  1.0 - Implementation of add button with pop
//
//  Known bugs:
//  save button doesnt

//
//  Created by Mirna Zaki on 2018-11-08.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit


class FriendSectionViewController: UIViewController, UICollectionViewDelegate,
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
            //let indexPath = IndexPath(row: 2, section: 0)
            //self.collection.insertItems(at: [indexPath])
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

       // var shiftx = 110
        //var shifty = 0;
        //for (index, nameOfFriend) in friends.enumerated(){
            //create button
            //let archivedData = NSKeyedArchiver.archivedData(withRootObject: profileImage as Any)
            //let button = NSKeyedUnarchiver.unarchiveObject(with: archivedData) as? UIButton
           // let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
           // let image = UIImage(named: "friends.png") as UIImage?
           // button.setImage(image, for: [])
//            var frm: CGRect = button.frame
//            if(shiftx >= 300){
//                frm.origin.x = frm.origin.x
//            }else{
//                frm.origin.x = frm.origin.x + CGFloat(shiftx)
//            }
//            shiftx += 110;
//            frm.origin.y = frm.origin.y + CGFloat(shifty)
//            if(index == 2 || (index-1)%3 == 0){
//                shifty += 200;
//                frm.origin.y = frm.origin.y + CGFloat(shifty)
//            }
//            button.frame = frm
         //   button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

            //create label
            //let archivedData2 = NSKeyedArchiver.archivedData(withRootObject: NewFriendName as Any)
            //let name = NSKeyedUnarchiver.unarchiveObject(with: archivedData2) as? UILabel
            //let name = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//            name?.text = nameOfFriend
//            var frm2: CGRect = name!.frame
//            frm2.origin.x = frm.origin.x
//            frm2.origin.y = frm2.origin.y + CGFloat(shifty)
//            name?.frame = frm2

            //add button and label to screen
           // self.view.addSubview(name!)
            //self.view.addSubview(button!)
           // collection.firstcell.addSubview(button)
        //}
//
//        for _view in view.subviews{
//            _view.removeFromSuperview()
//        }
//
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
        //cell.profileButton.button = UIButton(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        cell.friendName.text = friends[indexPath.row]
        let image = UIImage(named: "friends.png") as UIImage?
        cell.profileButton.setImage(image, for: [])
        //cell.configure(with: friends[indexPath.row])
        return cell
    }

}

//}
