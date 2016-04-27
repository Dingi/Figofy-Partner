//
//  ViewController.swift
//  Figofy Partner
//
//  Created by Janus Ringling on 26/04/2016.
//  Copyright © 2016 Figofy. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius = 50
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        return true
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func login(sender: AnyObject) {
        
        
        if let email = emailTextField.text where email != "", let pwd = passwordTextField.text where pwd != ""{
            
            DataService.dataService.REF_BASE.authUser(self.emailTextField.text, password: self.passwordTextField.text) { error, authData in
                if error != nil{
                    //not logged in
                    //self.showErrorAlert("Wrong email or password", msg: "Enter email and password")
                    print("not logged in")
                } else {
                    let uid = authData.uid
                    Partner.staticPartner.id = "\(uid)"
                    //self.getFirebasePartner(uid)
                    print("logged in \(uid)")
                    print("staticPartner.id: \(Partner.staticPartner.id)")
                    self.performSegueWithIdentifier("loginSegue", sender: nil)
                    
                }
            }
            
        }else {
            //showErrorAlert("No email or password", msg: "please enter email and password")
            print("error")
        }
        
    }

}

