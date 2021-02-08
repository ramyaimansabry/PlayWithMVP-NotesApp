//
//  UITableViewCell+Extention.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import UIKit


extension UITableViewCell  {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
