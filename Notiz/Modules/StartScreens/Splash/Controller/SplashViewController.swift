//
//  SplashViewController.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit


class SplashViewController: UIViewController {
    
    lazy var presenter = SplashVCPresenter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.viewWillAppear()
    }
    
}


extension SplashViewController: SplashView {
    func navigateToWelcomeScreen() {
        Navigator.navigate(form: self, to: .welcomeScreen, with: .present(transitionStyle: .crossDissolve), animated: true)
    }
    
    func navigateToLoginScreen() {
        Navigator.navigate(form: self, to: .login, with: .present(transitionStyle: .coverVertical), animated: true)
    }
    
    func navigateToHomeScreen() {
        Navigator.navigate(form: self, to: .homeList, with: .present(transitionStyle: .crossDissolve), animated: true)
    }
}
