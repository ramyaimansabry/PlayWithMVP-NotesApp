//
//  LoginViewController.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var textFieldsStackView: UIStackView!
    @IBOutlet weak var emailTextField: UnderLineTextField!
    @IBOutlet weak var passwordTextField: UnderLineTextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    
    private lazy var presenter = LoginVCPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    fileprivate func configureViews() {
        view.backgroundColor = UIColor.white
        contentStackView.spacing = min(max(view.frame.height / 12, 35), 45)
        signInButton.setShadow(withCornerRadius: 10)
        configureDontHaveAccountLabel()
    }
    
    func configureDontHaveAccountLabel() {
        let text = "Don't have account? Create now"
        dontHaveAccountLabel.text = text
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "Don't have account?")
        let range2 = (text as NSString).range(of: "Create now")
        underlineAttriString.addAttribute(.foregroundColor, value: DesignSystem.current.colors.secondaryColor, range: range1)
        underlineAttriString.addAttribute(.foregroundColor, value: DesignSystem.current.colors.primaryColor, range: range2)
        dontHaveAccountLabel.attributedText = underlineAttriString
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(createAccount(_:)))
        tapGesture.numberOfTouchesRequired = 1
        dontHaveAccountLabel.isUserInteractionEnabled = true
        dontHaveAccountLabel.addGestureRecognizer(tapGesture)
    }
    
    // MARK:- IBActions
    @IBAction func signInButton(_ sender: UIButton) {
        let email: String? = emailTextField.text
        let password: String? = passwordTextField.text
        presenter.signIn(with: email, password: password)
    }
    
    @objc func createAccount(_ sender: UITapGestureRecognizer) {
        Navigator.navigate(form: self, to: .register, with: .push, animated: true)
    }
}

// MARK: - Presenter Delegate
extension LoginViewController: LoginVCView {
    func navigateToHomeListScreen() {
        Navigator.navigate(form: self, to: .homeList, with: .present(transitionStyle: .coverVertical), animated: true)
    }
}
