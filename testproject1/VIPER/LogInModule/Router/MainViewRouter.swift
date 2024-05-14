//
//  MainViewRouter.swift
//  testproject1
//
//  Created by Guest Acc on 11.05.2024.
//

import Foundation
import UIKit

protocol MainViewRouterProtocol {
    func forgotPasswordButtonDidTapped()
    func newUserButtonDidTapped()
    func signInButtonDidTapped()
}

class MainViewRouter: MainViewRouterProtocol {
    
    
    weak var view: UIViewController?
    
    func forgotPasswordButtonDidTapped() {
        let ForgotPasswordViewController = ForgotPasswordViewController()
        view?.present(ForgotPasswordViewController, animated: true)
        print("router exist")
    }
    
    func newUserButtonDidTapped() {
        let NewUserViewController = NewUserViewController()
        view?.present(NewUserViewController, animated: true)
        print("router exist")
    }
    
    func signInButtonDidTapped() {
        let AuthenticationViewController = AuthenticationViewController()
        view?.present(AuthenticationViewController, animated: true)
        print("router exist")
    }
}
