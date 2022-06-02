//
//  LoginViewController.swift
//  GoogleServices
//
//  Created by Ahmed Fayeq on 02/06/2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didTapLogin(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            return
        }
        AuthManager.shared.login(email: email, password: password) { isSuccess in
            if isSuccess {
                print("loged in successfully")
            }else {
                print("error in loged in")
            }
        }
    }
    @IBAction func didTapRegister(_ sender: Any) {
        
    }
}
