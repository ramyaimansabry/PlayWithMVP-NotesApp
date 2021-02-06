//
//  String+Extention.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import Foundation


extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var isNumeric: Bool {
        guard !self.isEmpty else { return false }
        return !self.contains { Int(String($0)) == nil }
    }
    
    var isValidEmailAddress: Bool {
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    var hasOneCapitalLetterAtLeast: Bool {
        let regex = try! NSRegularExpression(pattern: ".*[A-Z]+.*")
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
