//
//  ThankYouViewController.swift
//  HU-Donations
//
//  Created by Cesa Salaam on 11/29/16.
//  Copyright © 2016 Cesa Salaam. All rights reserved.
//

import UIKit
//This is the view controller that is shown after a donation has ben made. It simply says thank you.

class ThankYouViewController: UIViewController {
    
    @IBAction func ExitPressed(_ sender: AnyObject) {
        //action for X button. Goes back to projectsController.
        let Controller = storyboard?.instantiateViewController(withIdentifier: "projectController") as! projectsController
        self.navigationController?.pushViewController(Controller, animated: true)
    }
}
