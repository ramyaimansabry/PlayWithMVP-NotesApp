//
//  HomeVCPresenter.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import Foundation


protocol HomeVCView: BaseViewProtocol {
    
}

class HomeVCPresenter {
    weak var view: HomeVCView?
    private let interactor = HomeVCInteractor()
    
    init(view: HomeVCView) {
        self.view = view
    }
}
