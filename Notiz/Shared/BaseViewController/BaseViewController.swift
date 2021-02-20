//
//  BaseViewController.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import UIKit
import IHProgressHUD


class BaseViewController: UIViewController {
    
    // MARK: Loading Indicator
    func showLoadingIndicator() {
        DispatchQueue.main.async {
            IHProgressHUD.show()
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            IHProgressHUD.dismiss()
        }
    }
    
    // MARK: Generic Alert
    func presentGenericAlert(title: String,
                             message: String,
                             doneButtonTitle: String = "OK",
                             dismissButtonTitle: String? = nil,
                             completion: @escaping(_ done: Bool) -> Void = {_ in} ) {
        
        if dismissButtonTitle != nil {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let doneAction = UIAlertAction(title: doneButtonTitle, style: .cancel) { (_) in
                completion(true)
            }
            let dissmisAction = UIAlertAction(title: dismissButtonTitle, style: .destructive) { (_) in
                completion(false)
            }
            alert.addAction(doneAction)
            alert.addAction(dissmisAction)
            present(alert, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let doneAction = UIAlertAction(title: doneButtonTitle, style: .cancel) { (_) in
                completion(true)
            }
            alert.addAction(doneAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func presentAlert(title: String, message: String) {
        presentGenericAlert(title: title, message: message)
    }
}
