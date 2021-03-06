//
//  detailViewController.swift
//  HU-Donations
//
//  Created by Cesa Salaam on 11/29/16.
//  Copyright © 2016 Cesa Salaam. All rights reserved.
//

import UIKit
import Social
//This controller display more detailed information about the project being viewed.
// This controller is called when a user taps on a project in the projectController
class detailViewController: UIViewController{

    var project: projectObject!
    
    @IBOutlet weak var projectImage: UIImageView! //Connection to image for project
    @IBOutlet weak var projectTitle: UILabel! //Connection to label for Project Title
    @IBOutlet weak var owner: UILabel! //Connection to label for Project Owner
    
    @IBOutlet weak var projectDescription: UITextView! // COnnection to textview to dislay Description of project
    
    @IBAction func donateAction(_ sender: AnyObject) {
        // function for when the donation button is clicked in this view.
        self.performSegue(withIdentifier: "toDonate", sender: project) //segue to new view.
    }
    @IBAction func exitButtonClicked(_ sender: AnyObject) {
        let Controller = storyboard?.instantiateViewController(withIdentifier: "projectController") as! projectsController
        self.navigationController?.pushViewController(Controller, animated: true)
    }
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var facebookShareButton: UIButton!
    
    @IBOutlet weak var viewHolder: UIView!
    @IBAction func faceBookShare(_ sender: AnyObject) {
        //function for sharing to facebook.
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
            let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.add(UIImage(named: self.project.projectImage))
            self.present(facebookSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        self.projectTitle.text = project.projectTitle
        self.owner.text = "by " + project.projectOwner
        self.projectDescription.text = project.projectDescription
        self.projectImage.image = UIImage(named: project.projectImage)
        
        projectDescription.layer.backgroundColor = UIColor.clear.cgColor
        projectImage.layer.shadowColor = UIColor.black.cgColor
        projectImage.layer.shadowOpacity = 1
        projectImage.layer.shadowOffset = CGSize.zero
        projectImage.layer.shadowRadius = 10
        
        shareButton.backgroundColor = .clear
        shareButton.layer.cornerRadius = 5
        shareButton.layer.borderWidth = 1
        shareButton.layer.borderColor = UIColor.orange.cgColor
        
        facebookShareButton.backgroundColor = .clear
        facebookShareButton.layer.cornerRadius = 5
        facebookShareButton.layer.borderWidth = 1
        facebookShareButton.layer.borderColor = UIColor.orange.cgColor
        
        viewHolder.backgroundColor = .clear
        viewHolder.layer.cornerRadius = 5
        viewHolder.layer.borderWidth = 1
        viewHolder.layer.borderColor = UIColor.blue.cgColor
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // sending current project to new veiw controller.
        if segue.identifier == "toDonate"{
            let destinationViewController = segue.destination as! DonationViewController
            destinationViewController.project = sender as? projectObject
        }
    }
    

}
