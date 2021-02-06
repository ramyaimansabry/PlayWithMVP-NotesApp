//
//  LoginVCPresenter.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import Foundation

protocol LoginVCView: class {
    
}

class LoginVCPresenter {
    private weak var view: LoginVCView?
    private let interactor = LoginVCInteractor()
    
    init(view: LoginVCView) {
        self.view = view
    }
}
