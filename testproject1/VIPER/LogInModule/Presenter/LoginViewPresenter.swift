//
//  LoginViewPresenter.swift
//  testproject1
//
//  Created by Guest Acc on 07.05.2024.
//

import Foundation

protocol LoginViewPresenterProtocol: LoginViewDelegate {
    
}


final class LoginViewPresenter: LoginViewPresenterProtocol {
    
    
    weak var loginView: LoginViewController?
    var interactor: LoginViewInteractor!
    var router: MainViewRouter?
    
    init(interactor: LoginViewInteractor) {
        self.interactor = interactor
    }
    
    func forgotPasswordButtonDidTapped() {
        if(interactor.forgotPasswordCheckData()) {
            router?.forgotPasswordButtonDidTapped()
        }
    }
    
    func newUserButtonDidTapped() {
        if(interactor.NewUserCheckData()) {
            router?.newUserButtonDidTapped()
        }
    }
    
    func signInButtonDidTapped() {
        if(interactor.SignInCheckData()) {
            router?.signInButtonDidTapped()
        }
    }
    
}
