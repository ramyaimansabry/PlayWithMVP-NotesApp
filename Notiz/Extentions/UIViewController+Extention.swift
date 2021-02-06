//
//  UIViewController+Extention.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit


extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
}
