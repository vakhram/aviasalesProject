//
//  LoginView.swift
//  testproject1
//
//  Created by Guest Acc on 07.05.2024.
//

import UIKit

//protocol LoginViewProtocol {
//    func setupUI()
//}

protocol LoginViewDelegate {
    func forgotPasswordButtonDidTapped()
    func newUserButtonDidTapped()
    func signInButtonDidTapped()
}

class LoginView: UIView {
    
    lazy var signInButton = CustomButton(title: "Sign in",hasBackground: true, buttonSize: .big)
    lazy var newUserButton = CustomButton(title: "New User? Create an account", buttonSize: .medium)
    lazy var forgotPasswordButton = CustomButton(title: "Forgot password? ", buttonSize: .small)
    lazy var textView: UITextView = {
        
        let attributedString = NSMutableAttributedString(string: "By creating account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy")
        
        attributedString.addAttribute(.link, value: "terms://termsAndConditions", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        attributedString.addAttribute(.link, value: "privacy://PrivacyPolicy", range: (attributedString.string as NSString).range(of: "Privacy Policy"))
        let textview = UITextView()
        textview.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        textview.backgroundColor = .clear
        textview.attributedText = attributedString
        textview.textColor = .label
        textview.isSelectable = true
        textview.isEditable = false
        textview.isScrollEnabled = false
        textview.delaysContentTouches = false
        
        return textview
    }()
    
    lazy var passwordTextField = CustomTextField(authFieldType: .password)
    lazy var usernameField = CustomTextField(authFieldType: .username)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        addSubview(passwordTextField)
        addSubview(usernameField)
        addSubview(textView)
        addSubview(signInButton)
        addSubview(newUserButton)
        addSubview(forgotPasswordButton)
        
        
        usernameField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
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
        textView.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).inset(-16)
            $0.leading.equalTo(passwordTextField.snp.leading)
            $0.trailing.equalTo(passwordTextField.snp.trailing)
            
        }
        newUserButton.snp.makeConstraints {
            $0.top.equalTo(textView.snp.bottom).inset(-16)
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
            break
        default:
            break
        }
        return true
    }
}
