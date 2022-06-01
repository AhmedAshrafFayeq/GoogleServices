//
//  RegistrationViewController.swift
//  GoogleServices
//
//  Created by Ahmed Fayeq on 02/06/2022.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func didTapRegister(_ sender: Any) {
       
        guard let email =  emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty,
              password == confirmPassword else {
                  print("Error filling data")
                  return
              }
        
        AuthManager.shared.register(email: email, password: password) { isSuccess in
            if isSuccess {
                print("to do save in firestore")
            }
            else {
                print("error in saving data")
            }
        }
    }
}
