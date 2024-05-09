//
//  LoginViewController.swift
//  testproject1
//
//  Created by Guest Acc on 07.05.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let contentView: LoginView = .init()
    private let headerView: CustomHeaderView = .init(title: "Sign in", subtitle: "Sign in your account")
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(headerView)
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
}

extension LoginViewController: LoginViewDelegate {
    func didpressLogInButton(username: String?, password: String?) {
        guard let username = username else { return }
        guard let password = password else { return }
        
    }
    
}
