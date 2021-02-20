//
//  IHProgressHUD+Extention.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit
import IHProgressHUD


extension IHProgressHUD {
    static func configure(){
        set(ringThickness: 5)
        set(cornerRadius: 30)
        set(minimumSize: CGSize(width: 30, height: 30))
        set(ringRadius: 25)
        set(backgroundColor: UIColor.white.withAlphaComponent(0.4))
        set(foregroundColor: DesignSystem.current.colors.primaryColor)
        set(defaultStyle: .custom)
        set(defaultMaskType: .black)
        set(defaultAnimationType: .native)
    }
}
