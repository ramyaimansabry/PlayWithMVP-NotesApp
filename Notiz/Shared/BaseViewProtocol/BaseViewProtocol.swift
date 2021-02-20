//
//  BaseViewProtocol.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import Foundation


protocol BaseViewProtocol: class {
    func presentGenericAlert(title: String,
                             message: String,
                             doneButtonTitle: String,
                             dismissButtonTitle: String?,
                             completion: @escaping(_ done: Bool) -> Void )
    func presentAlert(title: String, message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
}


extension BaseViewProtocol {
    func presentGenericAlert(title: String,
                             message: String,
                             doneButtonTitle: String = "OK",
                             dismissButtonTitle: String? = nil,
                             completion: @escaping(_ done: Bool) -> Void = {_ in} ) {
        
    }
}
