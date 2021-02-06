//
//  RegisterViewController.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit

class RegisterViewController: UIViewController {

    private lazy var presenter = RegisterVCPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension RegisterViewController: RegisterVCView {
    
}
