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
            guard let user = result?.user else { return }
            DataBaseManager.shared.saveUserDataToFireStore(userID: user.uid, username: "ahmeeed", age: 25) { isSuccess in
                print("user data is saved in Database")
            }
            completion(true)
            
        }
    }

    func login(email: String, password: String, completion: @escaping (Bool) -> (Void)) {
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil && error == nil else {
                completion(false)
                return
            }
            print("login success")
            completion(true)
            DataBaseManager.shared.downloadUserDataFromFirestore(userID: result?.user.uid ?? "") { name, age in
                print(name)
                print(age)
            }
        }
    }
}
