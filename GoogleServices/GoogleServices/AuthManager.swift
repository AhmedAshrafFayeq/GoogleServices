//
//  AuthManager.swift
//  GoogleServices
//
//  Created by Ahmed Fayeq on 02/06/2022.
//

import Foundation
import FirebaseAuth

class AuthManager {
    static let shared = AuthManager()
    private let auth = Auth.auth()
    
    private init() {
    }
    
    func register(email: String, password: String, completion: @escaping (Bool) -> (Void)) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil && error == nil else {
                completion(false)
                return
            }
            
            print("Account created successfuly!")
            completion(true)
            
        }
        
        
        
    }
}
