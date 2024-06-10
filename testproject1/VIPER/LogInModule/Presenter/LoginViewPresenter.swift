//
//  LoginViewPresenter.swift
//  testproject1
//
//  Created by Guest Acc on 07.05.2024.
//

import Foundation
import UIKit

protocol LoginViewPresenterProtocol: LoginViewDelegate {
    
}


final class LoginViewPresenter: LoginViewPresenterProtocol {
    
    
    weak var loginView: LoginViewController?
    let interactor: LoginViewInteractor!
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
        if(interactor.SignInCheckData(username: loginView?.contentView.usernameField.text, password: loginView?.contentView.passwordTextField.text)) {
            router?.signInButtonDidTapped()
        }
//        else {
//            let webViewer = WebViewController(urlString: "https://www.memeatlas.com/images/wojaks/wojak-what-should-I-feel.jpg")
//            let nav = UINavigationController(rootViewController: webViewer)
//            self.loginView?.present(nav, animated: true)
//
//        }
    }
    
}


