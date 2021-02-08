//
//  WelcomeVCPresenter.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import Foundation


protocol WelcomeView: class {
    func navigateToLoginScreen()
}

class WelcomeVCPresenter {
    private weak var view: WelcomeView?
    private let interactor = WelcomeVCInteractor()
    
    init(view: WelcomeView) {
        self.view = view
    }
    
    func startButtonActionFired() {
        SharedUserDefualts.isFirstOpenDone.setValue(value: true)
        view?.navigateToLoginScreen()
    }
}
