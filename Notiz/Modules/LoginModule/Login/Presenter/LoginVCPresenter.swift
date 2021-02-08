//
//  LoginVCPresenter.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import Foundation

protocol LoginVCView: BaseViewProtocol {
    func navigateToHomeListScreen()
}

class LoginVCPresenter {
    private weak var view: LoginVCView?
    private let interactor = LoginVCInteractor()
    
    init(view: LoginVCView) {
        self.view = view
    }
    
    // MARK:- Sign in
    func signIn(with email: String?, password: String?) {
        if validate(email: email) &&
            validate(password: password) {
            
            view?.showLoadingIndicator()
            interactor.signIn(email: email ?? "", password: password ?? "") { [weak self] (error) in
                
                guard let self = self else { return }
                self.view?.hideLoadingIndicator()
                if let error = error {
                    self.view?.presentAlert(title: "Error", message: error)
                }
                else {
                    self.userLoggedInSuccessfully()
                }
            }
        }
    }
    
    private func userLoggedInSuccessfully() {
        SharedUserDefualts.isUserLoggedIn.setValue(value: true)
        view?.navigateToHomeListScreen()
    }
    
    // MARK:- Validations
    private func validate(email: String?) -> Bool {
        if email?.IsValidString == false {
            view?.presentAlert(title: "Error", message: "Please enter your email")
            return false
        }
        else if email?.isValidEmailAddress == false {
            view?.presentAlert(title: "Error", message: "Invalid email")
            return false
        }
        return true
    }
    
    private func validate(password: String?) -> Bool {
        if password?.IsValidString == false {
            view?.presentAlert(title: "Error", message: "Please enter password")
            return false
        }
        else if password?.removeSpaces?.count ?? 0 < 8 {
            view?.presentAlert(title: "Error", message: "Password must be at least 8 characters")
            return false
        }
        else if password?.hasOneCapitalLetterAtLeast == false {
            view?.presentAlert(title: "Error", message: "Password must contain one capital letter at least")
            return false
        }
        return true
    }
}
