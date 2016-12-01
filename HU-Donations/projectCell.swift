//
//  projectCell.swift
//  HU-Donations
//
//  Created by Cesa Salaam on 11/8/16.
//  Copyright © 2016 Cesa Salaam. All rights reserved.
//

import UIKit

class projectCell: UITableViewCell {
    
    var delegate: UIViewController?
    
    @IBAction func FBShare(_ sender: AnyObject) {
        //part of creation of action for button to share to facebook
        FBTapped?(self)
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var projectHead: UILabel!
    @IBOutlet weak var imageVIew: UIImageView!
    
    var FBTapped: ((UITableViewCell) -> Void)?
}

























