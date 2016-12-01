//
//  projectObject.swift
//  HU-Donations
//
//  Created by Cesa Salaam on 11/25/16.
//  Copyright © 2016 Cesa Salaam. All rights reserved.
//

import UIKit
import Firebase

class projectObject: NSObject {
    //Object for project
    var projectImage: String!
    var projectDescription: String!
    var projectTitle: String!
    var backers = 0
    var watchers: String!
    var projectOwner: String!
    var donationAmount: Int!
    var currentIndex = 0
    
    init(snapshot: FIRDataSnapshot) {
        //function to pull data down from firebase.
        //key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        self.projectOwner = snapshotValue["Owner"] as! String
        self.projectTitle = snapshotValue["Title"] as! String
        self.projectImage = snapshotValue["Image"] as! String
        self.projectDescription = snapshotValue["Description"] as! String
    }
    override init() {}
    
    init(image: String, description: String, title: String, owner: String){
        self.projectTitle = title
        self.projectImage = image
        self.projectOwner = owner
        self.projectDescription = description
    }
    
   func convertToDict() -> NSDictionary{
    //converting object to dictionary so that it can be stored in firebase.
        let Dict = ["Owner": projectOwner, "Title": projectTitle,"Image": projectImage, "Description": projectDescription] as [String : Any]
        return Dict as NSDictionary
    }
}
