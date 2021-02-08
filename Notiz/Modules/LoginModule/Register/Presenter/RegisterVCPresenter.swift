//
//  RegisterVCPresenter.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import Foundation


protocol RegisterVCView: BaseViewProtocol {
    func navigateToHomeListScreen()
}

class RegisterVCPresenter {
    private weak var view: RegisterVCView?
    private let interactor = RegisterVCInteractor()
    
    init(view: RegisterVCView) {
        self.view = view
    }
    
    // MARK:- Register
    func register(fullName: String?, email: String?, password: String?, confirmPassword: String?) {
        if validate(fullName: fullName) &&
            validate(email: email) &&
            validate(password: password) &&
            validate(password: password, confirmPassword: confirmPassword) {
            
            view?.showLoadingIndicator()
            interactor.registerNewUser(fullName: fullName ?? "", email: email ?? "", password: password ?? "") { [weak self] (error) in
                
                guard let self = self else { return }
                self.view?.hideLoadingIndicator()
                if let error = error {
                    self.view?.presentAlert(title: "Error", message: error)
                }
                else {
                    self.userRegisteredSuccessfully()
                }
            }
        }
    }
    
    private func userRegisteredSuccessfully() {
        SharedUserDefualts.isUserLoggedIn.setValue(value: true)
        view?.navigateToHomeListScreen()
    }
    
    // MARK:- Validations
    private func validate(fullName: String?) -> Bool {
        if fullName?.IsValidString == false {
            view?.presentAlert(title: "Error", message: "Please enter your full name")
            return false
        }
        else if fullName?.removeSpaces?.count ?? 0 < 2 {
            view?.presentAlert(title: "Error", message: "Your name must be at least two characters")
            return false
        }
        return true
    }
    
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
    
    private func validate(password: String?, confirmPassword: String?) -> Bool {
        if confirmPassword?.IsValidString == false {
            view?.presentAlert(title: "Error", message: "Please enter confirm password")
            return false
        }
        else if password != confirmPassword {
            view?.presentAlert(title: "Error", message: "Password not equal confirm password")
            return false
        }
        return true
    }
}
