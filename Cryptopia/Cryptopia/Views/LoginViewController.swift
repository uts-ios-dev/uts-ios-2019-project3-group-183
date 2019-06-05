//
//  LoginViewController.swift
//  Cryptopia
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
        passwordTF.isSecureTextEntry = true
    }
    
    
    @IBAction func login(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "Login")
        UserDefaults.standard.set(UsernameTF.text, forKey:"Username")
    }
}
