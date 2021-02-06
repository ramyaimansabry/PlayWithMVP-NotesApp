//
//  LoginViewController.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit

class LoginViewController: UIViewController {

    private lazy var presenter = LoginVCPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.red
    }

}

extension LoginViewController: LoginVCView {
    
}
