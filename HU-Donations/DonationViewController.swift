//
//  DonationViewController.swift
//  HU-Donations
//
//  Created by Cesa Salaam on 11/29/16.
//  Copyright © 2016 Cesa Salaam. All rights reserved.
//

import UIKit

class DonationViewController: UIViewController, PayPalPaymentDelegate {

    var project: projectObject!
    @IBOutlet weak var donateAmount: UITextField!
    
// Setting up required Items for paypal
    
    var environment:String = PayPalEnvironmentNoNetwork {
        willSet(newEnvironment) {
            if (newEnvironment != environment) {
                PayPalMobile.preconnect(withEnvironment: newEnvironment)
            }
        }
    }
    var payPalConfig = PayPalConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up payPalConfig
        payPalConfig.acceptCreditCards = false
        payPalConfig.merchantName = "Howard University"
        payPalConfig.merchantPrivacyPolicyURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
        payPalConfig.merchantUserAgreementURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
        
        payPalConfig.languageOrLocale = Locale.preferredLanguages[0]
        payPalConfig.payPalShippingAddressOption = .payPal

    }

    // PayPalPaymentDelegate
    
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        print("PayPal Payment Cancelled")
        let Controller = storyboard?.instantiateViewController(withIdentifier: "projectController") as! projectsController
        self.navigationController?.pushViewController(Controller, animated: true)
        paymentViewController.dismiss(animated: true, completion: nil)
        
    }
    
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        print("PayPal Payment Success !")
        paymentViewController.dismiss(animated: true, completion: { () -> Void in
            // send completed confirmaion to your server
            print("Here is your proof of payment:\n\n\(completedPayment.confirmation)\n\nSend this to your server for confirmation and fulfillment.")
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        PayPalMobile.preconnect(withEnvironment: environment)
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
    }
    
    @IBAction func donateAction(_ sender: AnyObject) {
        //function for when donate button is clicked
        //creates an item being "sold" (ie. Donated to).
        let item1 = PayPalItem(name: project.projectTitle, withQuantity: 1, withPrice: NSDecimalNumber(string: donateAmount.text), withCurrency: "USD", withSku: "Hip-0037")
        let items = [item1]
        let subtotal = PayPalItem.totalPrice(forItems: items)
        
        // Optional: include payment details
        let shipping = NSDecimalNumber(string: "0.00")
        let tax = NSDecimalNumber(string: "0.00")
        let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
        
        let total = subtotal.adding(shipping).adding(tax)
        
        let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "Howard Project.", intent: .sale)
        
        payment.items = items
        payment.paymentDetails = paymentDetails
        
        if (payment.processable) {
            let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
            present(paymentViewController!, animated: true, completion: nil)
            //If payment was processed then go to view controller that shows "Thank you."
            //let tempController = storyboard?.instantiateViewController(withIdentifier: "projectController") as! projectsController
            
            //tempController.projects[tempController.projects.index(of: project)!].backers = tempController.projects[tempController.projects.index(of: project)!].backers + 1
            
            let Controller = storyboard?.instantiateViewController(withIdentifier: "thankYou") as! ThankYouViewController
            self.navigationController?.pushViewController(Controller, animated: true)
        }
        else {
            // This particular payment will always be processable. If, for
            // example, the amount was negative or the shortDescription was
            // empty, this payment wouldn't be processable, and you'd want
            // to handle that here.
            print("Payment not processalbe: \(payment)")
        }

    }
}
