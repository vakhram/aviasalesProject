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
        let ForgotPasswordViewController = Builder.buildForgotPasswordModule()
        view?.present(ForgotPasswordViewController, animated: true)
    }
    
    func newUserButtonDidTapped() {
        let NewUserViewController = Builder.buildNewUserModule()
        view?.present(NewUserViewController, animated: true)
    }
    
    func signInButtonDidTapped() {
        view?.dismiss(animated: true)
    }
}
