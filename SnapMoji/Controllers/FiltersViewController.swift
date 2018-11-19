//
//  FiltersViewController.swift
//  SnapMoji
//
//  Worked on by: Josh Baltar
//
//  Changelog:
//  1.0 - Initial commit of UI and segues
//  2.0 - Added feature of filtering friends in the tests
//
//  Known bugs:
//  Cancel button does not reset the changes made by the filter
//
//  Created by Josh Baltar on 2018-11-17.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "friendCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        //cell.textLabel?.text = friends[indexPath.row]
        cell.textLabel?.text = self.dataArray.object(at: indexPath.row) as? String
        if selectedDataArray.contains(self.dataArray.object(at: indexPath.row) as! String) {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if selectedDataArray.contains(self.dataArray.object(at: indexPath.row) as! String)
            {
                
                print("uncheck")
                cell.accessoryType = .none
                selectedDataArray.remove(self.dataArray.object(at: indexPath.row) as! String)
            }
            else {
                if cell.accessoryType == .checkmark {
                    cell.accessoryType = .none
                    print("don't include ", friends[indexPath.row])
                    delete(element: friends[indexPath.row])
                }
                else {
                    print("include ", friends[indexPath.row])
                    friendsFiltered.append(friends[indexPath.row])
                    cell.accessoryType = .checkmark
                    selectedDataArray.remove(self.dataArray.object(at: indexPath.row) as! String)
                }
                
                
            }
        }
    }

    
    @IBOutlet weak var friendsTableView: UITableView!
    var dataArray: NSMutableArray = NSMutableArray()
    var selectedDataArray: NSMutableArray = NSMutableArray()
    
    
    @IBAction func cancelButton_tap(_ sender: UIButton) {
        removeAnimate()
    }
    
    @IBAction func saveButton_tap(_ sender: UIButton) {
        //do other stuff
        
        removeAnimate()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimate()
        
        self.dataArray = NSMutableArray(array: friends)
        self.friendsTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "friendCell")
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        //displayFriendsSelection()
    }
    
    func delete(element: String) {
        friendsFiltered = friendsFiltered.filter() { $0 != element }
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
    
    /*
    func displayFriendsSelection() {
        print("Displaying friends to filter")
        let index = friends.count
        for i in 0..<index {
            let checkbox = CheckBox(frame: CGRect(x: 0, y: i * 40, width: 40, height: 40))
            checkbox.tag = 1
            self.view.addSubview(checkbox)
            print("Looping: Display ", friends[i])
        }
    }
    */


}
