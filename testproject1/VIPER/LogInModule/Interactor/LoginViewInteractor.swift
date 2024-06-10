//
//  LoginViewInteractor.swift
//  testproject1
//
//  Created by Guest Acc on 11.05.2024.
//

import Foundation
import UIKit

protocol LoginViewInteractorProtocol {
    
}

final class LoginViewInteractor: LoginViewInteractorProtocol {
    weak var presenter: LoginViewPresenter?
    
    func forgotPasswordCheckData() -> Bool {
        return true
    }
    
    func NewUserCheckData() -> Bool  {
        return true
    }
    
    func SignInCheckData(username: String?, password: String?) -> Bool  {
        guard let username = username, username != "" else {
            AlertManager.showUserNameValidationError(on: presenter?.loginView ?? UIViewController())
            return false
        }
        guard let password = password, password != ""  else {
            AlertManager.showPasswordValidationError(on: presenter?.loginView ?? UIViewController())
            return false
        }
        return true
    }
    
}
