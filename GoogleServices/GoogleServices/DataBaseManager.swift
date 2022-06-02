//
//  DataBaseManager.swift
//  GoogleServices
//
//  Created by Ahmed Fayeq on 02/06/2022.
//

import Foundation
import Firebase

class DataBaseManager {
    
    static let shared = DataBaseManager()
    let database = Firestore.firestore()
    
    
    private init() { }
    
    
    func saveUserDataToFireStore(userID: String, username: String, age: Int, completion: @escaping (Bool)-> Void) {
        let data: [String:  Any] = [
            "username": username,
            "age": age
        ]
        //path with folder Users
        database.collection("Users").document(userID).setData(data) { error in
            completion(error == nil)            
        }
    }
}
