//
//  SplashVCPresenter.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import Foundation

protocol SplashView: class {
    func navigateToWelcomeScreen()
    func navigateToLoginScreen()
    func navigateToHomeScreen()
}

class SplashVCPresenter {
    private weak var view: SplashView?
    private let interactor = SplashVCInteractor()
    
    init(view: SplashView) {
        self.view = view
    }
    
    func viewWillAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self else { return }
            self.checkUserLogin()
        }
    }
    
    private func checkUserLogin() {
        if let isUserLoggedIn: Bool = SharedUserDefualts.isUserLoggedIn.getValue() as? Bool, isUserLoggedIn == true {
            view?.navigateToHomeScreen()
        }
        else if let isFirstOpenDone: Bool = SharedUserDefualts.isFirstOpenDone.getValue() as? Bool, isFirstOpenDone == true {
            view?.navigateToLoginScreen()
        }
        else {
            view?.navigateToWelcomeScreen()
        }
    }
}
