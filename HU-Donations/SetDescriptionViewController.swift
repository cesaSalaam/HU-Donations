//
//  SetDescriptionViewController.swift
//  HU-Donations
//
//  Created by Cesa Salaam on 11/28/16.
//  Copyright © 2016 Cesa Salaam. All rights reserved.
//

import UIKit

class SetDescriptionViewController: UIViewController {
    
    @IBAction func addDescription(_ sender: AnyObject) {
        secondProtocol?.setDescription(description: descriptionText.text)
    }
    @IBOutlet weak var descriptionText: UITextView!
    var secondProtocol: newProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        // Do any additional setup after loading the view.
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
