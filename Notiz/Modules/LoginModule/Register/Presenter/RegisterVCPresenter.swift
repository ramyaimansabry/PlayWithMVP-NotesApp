//
//  RegisterVCPresenter.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import Foundation


protocol RegisterVCView: class {
    
}

class RegisterVCPresenter {
    private weak var view: RegisterVCView?
    private let interactor = RegisterVCInteractor()
    
    init(view: RegisterVCView) {
        self.view = view
    }
}
