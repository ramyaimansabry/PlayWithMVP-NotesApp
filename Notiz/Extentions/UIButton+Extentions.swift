//
//  UIButton.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit


extension UIButton {
    func setShadow(withCornerRadius radius: CGFloat) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 20
        layer.cornerRadius = radius
    }
}
