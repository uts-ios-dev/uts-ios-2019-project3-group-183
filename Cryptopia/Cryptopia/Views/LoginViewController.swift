//
//  LoginViewController.swift
//  Cryptopia
//
//  Simulates a login screen. Currently does not log in into any real accounts
//
//  Created by Richard James on 5/6/19.
//  Copyright © 2019 UTS_iOSDev. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var UsernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hides the characters entered into the text field
        passwordTF.isSecureTextEntry = true
    }
    
    
    @IBAction func login(_ sender: Any) {
        //Sets a flag that tells the app that the user is curently logged in
        UserDefaults.standard.set(true, forKey: "Login")
        //Changes the user name to the entered user name
        UserDefaults.standard.set(UsernameTF.text, forKey:"Username")
    }
}
