//
//  WelcomeViewController.swift
//  Notiz
//
//  Created by Ramy Sabry on 06/02/2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    private lazy var presenter = WelcomeVCPresenter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        descriptionLabel.text = "Capture whats on your mind & get a reminder later at the right place or time.\nCheck more features now!"
        startButton.setShadow(withCornerRadius: 25)
        startButton.setTitleColor(UIColor.gray, for: .highlighted)
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        presenter.startButtonActionFired()
    }
}


extension WelcomeViewController: WelcomeView {
    func navigateToLoginScreen() {
        Navigator.navigate(form: self, to: .login, with: .push, animated: true)
    }
}
