//
//  LoginView.swift
//  testproject1
//
//  Created by Guest Acc on 07.05.2024.
//

import UIKit

protocol LoginViewDelegate {
    func didpressLogInButton(email: String?, password: String?)
}

class LoginView: UIView {
    
    lazy var logInButton = createLogInButton()
    lazy var logInTextField = createLoginTextField()
    lazy var passwordTextField = createLoginPasswordTextField()
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
        
        addSubview(logInTextField)
        addSubview(passwordTextField)
        addSubview(usernameField)
        addSubview(logInButton)
        
        logInTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(64)
            $0.trailing.equalToSuperview().offset(-64)
            $0.centerY.equalToSuperview().offset(-144)
            $0.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(logInTextField.snp.bottom).inset(-16)
            $0.leading.equalTo(logInTextField.snp.leading)
            $0.trailing.equalTo(logInTextField.snp.trailing)
            $0.height.equalTo(50)
        }
        usernameField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).inset(-16)
            $0.leading.equalTo(logInTextField.snp.leading)
            $0.trailing.equalTo(logInTextField.snp.trailing)
            $0.height.equalTo(50)
        }
        logInButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(128)
            $0.trailing.equalToSuperview().offset(-128)
            $0.top.equalTo(usernameField.snp.bottom).inset(-32)
        }
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case logInTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            loginViewDelegate?.didpressLogInButton(email: logInTextField.text, password: passwordTextField.text)
        default:
            break
            
        }
        return true
    }
}
