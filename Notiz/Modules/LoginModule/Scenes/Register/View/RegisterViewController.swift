//
//  RegisterViewController.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var backButtonTopLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var textFieldsStackView: UIStackView!
    @IBOutlet weak var fullNameTextField: UnderLineTextField!
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
        backButtonTopLayoutConstraint.constant = (UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0) + 15
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
        let fullName: String? = fullNameTextField.text
        let email: String? = emailTextField.text
        let password: String? = passwordTextField.text
        let confirmPassword: String? = confirmPasswordTextField.text
        presenter.register(fullName: fullName,
                           email: email,
                           password: password,
                           confirmPassword: confirmPassword)
    }
    
}

// MARK: - Presenter Delegate
extension RegisterViewController: RegisterVCView {
    func navigateToHomeListScreen() {
        Navigator.navigate(form: self, to: .homeList, with: .present(transitionStyle: .coverVertical), animated: true)
    }
}
