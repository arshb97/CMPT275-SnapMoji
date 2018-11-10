//
//  CollectionViewCell.swift
//  SnapMoji
//
//  Description of CollectionViewCell:
//  This file has not been implemented yet, but is for the display of the friends in the
//  friend section
//
//
//  Worked on by: Jiung Choi, Merna Zaki
//
//
//  Changelog:
//  1.0 - This is the initial commit of our view controller
//  2.0 - added the items in the cell for the collection view
//
//  Known bugs:
//  There are no known bugs related to the ViewController.swift
//
//  Created by Jiung Choi on 10/26/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileButton: UIButton! //Button with a proile pitcure
    @IBOutlet weak var friendName: UILabel! //label containing the friends name
}
