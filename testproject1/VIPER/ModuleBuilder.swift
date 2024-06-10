//
//  LogInModuleBuilder.swift
//  testproject1
//
//  Created by Guest Acc on 14.05.2024.
//

import Foundation
import UIKit

class Builder {
    static func buildForgotPasswordModule() -> UIViewController {
        
        let interactor = ForgotPasswordInteractor()
        let presenter = ForgotPasswordPresenter(interactor: interactor)
        let view = ForgotPasswordViewController(presenter: presenter)
        let router = ForgotPasswordRouter()
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.view = view
        
        return view
    }
    static func buildNewUserModule() -> UIViewController {
        let interactor = NewUserInteractor()
        let presenter = NewUserPresenter(interactor: interactor)
        let view = NewUserViewController(presenter: presenter)
        let router = NewUserRouter()
        
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.view = view
        
        return view
    }
    static func buildLogInModule() -> UIViewController {
        let interactor = LoginViewInteractor()
        let presenter = LoginViewPresenter(interactor: interactor)
        let view = LoginViewController(presenter: presenter)
        let router = MainViewRouter()
        
        interactor.presenter = presenter
        presenter.router = router
        presenter.loginView = view
        router.view = view
        
        return view
    }
}
