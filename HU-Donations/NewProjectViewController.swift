//
//  NewProjectViewController.swift
//  HU-Donations
//
//  Created by Cesa Salaam on 11/27/16.
//  Copyright © 2016 Cesa Salaam. All rights reserved.
//

import UIKit

import Social

class NewProjectViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate,UITableViewDataSource, newProtocol{
    
    @IBOutlet weak var newProjectTableView: UITableView!
    @IBOutlet weak var uploadImageButton: UIButton!
    @IBOutlet weak var projectImage: UIImageView!
    @IBAction func newPhotoAction(_ sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func createProject(_ sender: AnyObject) {
        let imageData = UIImagePNGRepresentation(projectImage.image!)
        let base64String = imageData?.base64EncodedString(options:NSData.Base64EncodingOptions(rawValue: 0))
        let newProject = projectObject.init(image: base64String!, description: projectProperties[1]!, title: projectProperties[0]!, owner: projectProperties[2]!)
            FIRService.FIRBase.pushProject(project: newProject)
    }
    
    var projectProperties: [Int: String] = [0 :" ", 1 :" ", 2 :"Howard University: Computer Science"]
    let alertController = UIAlertController(title: "Error", message: "Please enter data for all of the fields.", preferredStyle: UIAlertControllerStyle.alert)
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    
    }
    override func viewWillAppear(_ animated: Bool) {
        newProjectTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch indexPath.row{
        case 0:
            cell.textLabel?.text = "Project Title"
            cell.detailTextLabel?.text = projectProperties[indexPath.row]
            break
        case 1:
            cell.textLabel?.text = "Project Description"
            cell.detailTextLabel?.text = projectProperties[indexPath.row]
            break
        case 2:
            cell.textLabel?.text = "Project Owner"
            cell.detailTextLabel?.text = projectProperties[indexPath.row]
            break
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("0")
            let editController = storyboard?.instantiateViewController(withIdentifier: "editTitleController") as! setTitleViewController
            editController.myProtocol = self
            self.navigationController?.pushViewController(editController, animated: true)
            break
        case 1:
            print("1")
            let editController = storyboard?.instantiateViewController(withIdentifier: "editDescriptionController") as! SetDescriptionViewController
            editController.secondProtocol = self
            self.navigationController?.pushViewController(editController, animated: true)
            break
        default:
            break
        }

    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.projectImage.contentMode = .scaleAspectFit
            self.projectImage.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - New Protocol definitions
    func setTitle(title: String) {
        projectProperties.updateValue(title, forKey:  0)
    }
    
    func setDescription(description: String) {
        projectProperties.updateValue(description, forKey: 1)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSetTitle"{
            let destinationViewController = segue.destination as! setTitleViewController
            destinationViewController.project = sender as? projectObject
        } else if segue.identifier == "toSetTitle"{
            let destinationViewController = segue.destination as! SetDescriptionViewController
            destinationViewController.project = newProject
        }
    }*/
    
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
    }
}
