//
//  Navigator.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit

enum Destination {
    case splashScreen
    case welcomeScreen
    case login
    case register
}

class Navigator: NavigatorProtocol {
    
    static func viewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .splashScreen:
            let viewController = SplashViewController.loadFromNib()
            return viewController
        case .welcomeScreen:
            let viewController = WelcomeViewController.loadFromNib()
            return viewController
        case .login:
            let viewController = LoginViewController.loadFromNib()
            return viewController
        case .register:
            let viewController = RegisterViewController.loadFromNib()
            return viewController
        }
    }
}
