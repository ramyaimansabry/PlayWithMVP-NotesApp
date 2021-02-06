//
//  SharedUserDefualts.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit


enum SharedUserDefualts: String {
    
    case userEmail = "LoggedInUserEmail"
    case userFullName = "LoggedInUserFullName"
    case isUserLoggedIn = "isUserLoggedIn"
    case isFirstOpenDone = "isFirstOpenDone"
    case userLocationLAT = "LoggedInUserLocationLatitude"
    case userLocationLONG = "LoggedInUserLocationLongitude"
    
    // MARK:- Store
    func setValue(value : Any) {
        if self == .isUserLoggedIn || self == .isFirstOpenDone, let castedValue = value as? Bool {
            UserDefaults.standard.set(castedValue, forKey: rawValue)
        }
        else {
            UserDefaults.standard.set(value, forKey: rawValue)
        }
        UserDefaults.standard.synchronize()
    }
    
    // MARK:- Retrieve
    func getValue() -> Any {
        if self == .isUserLoggedIn || self == .isFirstOpenDone {
            if let result = UserDefaults.standard.object(forKey: rawValue) as? Bool {
                return result
            }
            return false
        }
        return UserDefaults.standard.object(forKey: rawValue)  ?? ""
    }
    
    
    // MARK:- Delete
    func deleteValue() {
        UserDefaults.standard.removeObject(forKey: rawValue)
    }
}

