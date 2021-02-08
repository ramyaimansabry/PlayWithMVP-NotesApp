//
//  HomeViewController.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import UIKit

class HomeViewController: BaseViewController {

    private lazy var presenter = HomeVCPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    fileprivate func configureViews() {
        view.backgroundColor = UIColor.lightGray
    }
}

extension HomeViewController: HomeVCView {
    
}
