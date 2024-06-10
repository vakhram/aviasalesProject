//
//  NewUserView.swift
//  testproject1
//
//  Created by Guest Acc on 13.05.2024.
//

import UIKit

final class NewUserView: UIView {
    
    let usernameTextField: CustomTextField = .init(authFieldType: .username)
    let emailTextField: CustomTextField = .init(authFieldType: .email)
    let passwordTextField: CustomTextField = .init(authFieldType: .password)
    let createAccountButton: CustomButton = .init(title: "Create account", hasBackground: true , buttonSize: .big)

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(usernameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(createAccountButton)
        
        usernameTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-112)
            $0.leading.equalToSuperview().offset(64)
            $0.trailing.equalToSuperview().offset(-64)
            $0.height.equalTo(50)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).inset(-16)
            $0.leading.equalTo(usernameTextField.snp.leading)
            $0.trailing.equalTo(usernameTextField.snp.trailing)
            $0.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).inset(-16)
            $0.leading.equalTo(emailTextField.snp.leading)
            $0.trailing.equalTo(emailTextField.snp.trailing)
            $0.height.equalTo(50)
        }
        createAccountButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).inset(-16)
            $0.leading.equalToSuperview().offset(88)
            $0.trailing.equalToSuperview().offset(-88)
        }
    }

}
