//
//  LoginViewController.swift
//  testproject1
//
//  Created by Guest Acc on 07.05.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let contentView: LoginView = .init()
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}

extension LoginViewController: LoginViewDelegate {
    func didpressLogInButton(email: String?, password: String?) {
        guard let email = email else { return }
        guard let password = password else { return }
        
    }
    
}
