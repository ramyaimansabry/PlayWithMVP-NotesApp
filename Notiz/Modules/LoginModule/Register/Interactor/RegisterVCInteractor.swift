//
//  RegisterVCInteractor.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import Foundation
import Firebase


class RegisterVCInteractor {
    
    func registerNewUser(fullName: String, email: String, password: String, completion: @escaping(_ error: String?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {
                completion(error.localizedDescription)
            }
            else if let userId =  authResult?.user.uid {
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["fullName" : fullName, "uid": userId]) { (error) in
                    
                    if let error = error {
                        completion(error.localizedDescription)
                    }
                    else {
                        completion(nil)
                    }
                }
            }
        }
    }
}
