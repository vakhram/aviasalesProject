//
//  LoginViewInteractor.swift
//  testproject1
//
//  Created by Guest Acc on 11.05.2024.
//

import Foundation

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
    
    func SignInCheckData() -> Bool  {
       return true
    }
    
}
