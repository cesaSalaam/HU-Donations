//
//  projectsController.swift
//  HU-Donations
//
//  Created by Cesa Salaam on 11/8/16.
//  Copyright © 2016 Cesa Salaam. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase
import Social

//
// This controller is for the view that displays the projects.

class projectsController: UITableViewController, UISearchBarDelegate {

    @IBOutlet var projectsTableView: UITableView!
    var projects = [projectObject]() //This is an array of type project:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true) // hiding navigation back button on main screen.
        projects.append(contentsOf: projectArray) // Adding projects to array.
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // This function tells how many rows will be displayed in the view. The rumber of rows is based off of the number of projects in the project array declared at the top.
        return (projects.count)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //This function sets the data in each row. The data comes from the projects in the project array.
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! projectCell // Creating the
        
            cell.title.text = projects[indexPath.row].projectTitle //Setting the title of the project
        
            cell.imageVIew.image = UIImage(named: projects[indexPath.row].projectImage) //Setting the image for the project
            
            /*cell.FBTapped = {(cell) in
            }*/
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //function for when user clicks on project for more information.
        projects[indexPath.row].currentIndex = indexPath.row
        self.performSegue(withIdentifier: "detailView", sender: projects[indexPath.row])
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //function to send the project that was click to other view.
        if segue.identifier == "detailView"{
            let destinationViewController = segue.destination as! detailViewController
            destinationViewController.project = sender as? projectObject
    }
}
}
