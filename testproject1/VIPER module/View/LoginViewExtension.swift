//
//  LoginViewExtension.swift
//  testproject1
//
//  Created by Guest Acc on 07.05.2024.
//

import Foundation
import UIKit

extension LoginView {
    
    func createTextField(with placeholderText: String?) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholderText
        
        return textField
    }
    
    func createLoginTextField() -> UITextField {
        let textField = createTextField(with: "Login")
        
        return textField
    }
    
    func createLoginPasswordTextField() -> UITextField {
        let textField = createTextField(with: "Password")
        
        return textField
    }
    
    func createLogInButton() -> UIButton {
        
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        
        return button
        
    }
    
}
