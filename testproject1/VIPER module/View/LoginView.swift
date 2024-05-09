//
//  LoginView.swift
//  testproject1
//
//  Created by Guest Acc on 07.05.2024.
//

import UIKit

protocol LoginViewDelegate {
    func didpressLogInButton(username: String?, password: String?)
}

class LoginView: UIView {
    
    lazy var signInButton = CustomButton(title: "Sign in",hasBackground: true, buttonSize: .big)
    lazy var newUserButton = CustomButton(title: "New User? Create an account", buttonSize: .medium)
    lazy var forgotPasswordButton = CustomButton(title: "Forgot password? ", buttonSize: .small)
    
    lazy var passwordTextField = CustomTextField(authFieldType: .password)
    lazy var usernameField = CustomTextField(authFieldType: .username)
    
    var loginViewDelegate: LoginViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        addSubview(passwordTextField)
        addSubview(usernameField)
        addSubview(signInButton)
        addSubview(newUserButton)
        addSubview(forgotPasswordButton)
        
        
        usernameField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(64)
            $0.trailing.equalToSuperview().offset(-64)
            $0.centerY.equalToSuperview().offset(-112)
            $0.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameField.snp.bottom).inset(-16)
            $0.leading.equalTo(usernameField.snp.leading)
            $0.trailing.equalTo(usernameField.snp.trailing)
            $0.height.equalTo(50)
        }
        signInButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(128)
            $0.trailing.equalToSuperview().offset(-128)
            $0.top.equalTo(passwordTextField.snp.bottom).inset(-32)
        }
        newUserButton.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).inset(-16)
            $0.centerX.equalToSuperview()
        }
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(newUserButton.snp.bottom).inset(-16)
            $0.centerX.equalToSuperview()
        }
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            loginViewDelegate?.didpressLogInButton(username: usernameField.text, password: passwordTextField.text)
        default:
            break
            
        }
        return true
    }
}
