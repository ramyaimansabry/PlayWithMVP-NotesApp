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
    case homeList
    case createNew
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
        case .homeList:
            let viewController = HomeViewController.loadFromNib()
            return viewController
        case .createNew:
            let viewController = CreateNoteViewController.loadFromNib()
            return viewController
        }
    }
}
