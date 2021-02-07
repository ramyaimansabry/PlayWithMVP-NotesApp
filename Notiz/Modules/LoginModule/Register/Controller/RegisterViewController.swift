//
//  RegisterViewController.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var backButtonTopLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var textFieldsStackView: UIStackView!
    @IBOutlet weak var fullNameTextFields: UnderLineTextField!
    @IBOutlet weak var emailTextField: UnderLineTextField!
    @IBOutlet weak var passwordTextField: UnderLineTextField!
    @IBOutlet weak var confirmPasswordTextField: UnderLineTextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    private lazy var presenter = RegisterVCPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    fileprivate func configureViews() {
        view.backgroundColor = UIColor.white
        contentStackView.spacing = min(max(view.frame.height / 12, 35), 45)
        configureSignUpButton()
    }
    
    private func configureSignUpButton() {
        signUpButton.setShadow(withCornerRadius: 10)
    }
    
    // MARK:- IBActions
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        
    }
    
}

extension RegisterViewController: RegisterVCView {
    
}
