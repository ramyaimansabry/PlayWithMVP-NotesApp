//
//  LoginVCInteractor.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import Foundation
import Firebase


class LoginVCInteractor {
    
    func signIn(email: String, password: String, completion: @escaping(_ error: String?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {
                completion(error.localizedDescription)
            }
            else {
                completion(nil)
            }
        }
    }
}
