//
//  FIRService.swift
//  HU-Donations
//
//  Created by Cesa Salaam on 11/27/16.
//  Copyright © 2016 Cesa Salaam. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class FIRService: NSObject {
    static let FIRBase = FIRService()
    
    func pushProject(project: projectObject){
        //function to upload project to firebase.
        FIRDatabase.database().reference().child("projects").childByAutoId().setValue(project.convertToDict())
    }
}
