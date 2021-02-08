//
//  Encodable+Extention.swift
//  Notiz
//
//  Created by Ramy Sabry on 09/02/2021.
//

import Foundation


extension Encodable {

    var dict : [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return nil }
        return json
    }
    
}
