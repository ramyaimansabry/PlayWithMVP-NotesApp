//
//  NavigatorProtocol.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit

enum NavigatorTypes {
    case push
    case present(transitionStyle: UIModalTransitionStyle)
    case root
}

protocol NavigatorProtocol {
    static func navigate(form view: UIViewController,
                         to destination: Destination,
                         with navigationType: NavigatorTypes,
                         animated: Bool) -> UIViewController
}

extension NavigatorProtocol {
    static func navigate(form view: UIViewController,
                         to destination: Destination,
                         with navigationType: NavigatorTypes = .push,
                         animated: Bool) -> UIViewController {
        let viewController = Navigator.viewController(for: destination)
        switch navigationType {
        case .push:
            view.navigationController?.pushViewController(viewController, animated: animated)
        case .present(let transitionStyle):
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.modalTransitionStyle = transitionStyle
            navigationController.isNavigationBarHidden = true
            view.present(navigationController, animated: animated, completion: nil)
        case .root:
            view.navigationController?.setViewControllers([viewController], animated: animated)
        }
        return viewController
    }
}
