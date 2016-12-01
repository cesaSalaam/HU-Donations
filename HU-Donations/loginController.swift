//
//  loginController.swift
//  HU-Donations
//
//  Created by Cesa Salaam on 11/28/16.
//  Copyright © 2016 Cesa Salaam. All rights reserved.
//

import UIKit
import FirebaseAuth

class loginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpAction(_ sender: AnyObject) {
        FIRAuth.auth()!.createUser(withEmail: "cesa.salaam@howard.bison.com", password: "howard123") { user, error in
            if error == nil {
                FIRAuth.auth()!.signIn(withEmail:"cesa.salaam@howard.bison.com" , password: "howard123")
                self.performSegue(withIdentifier: "toProjects", sender: self)
            }
        }

    }
    
    @IBAction func loginAction(_ sender: AnyObject) {
        FIRAuth.auth()!.signIn(withEmail: "cesa.salaam@howard.bison.com", password: "howard123") { (user, error) in
            if error == nil {
                print(user?.email)
                self.performSegue(withIdentifier: "toProjects", sender: self)
            }else{
                print(error?.localizedDescription)
            }
        }
        
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
