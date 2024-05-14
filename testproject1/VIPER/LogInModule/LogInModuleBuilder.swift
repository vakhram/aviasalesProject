//
//  LogInModuleBuilder.swift
//  testproject1
//
//  Created by Guest Acc on 14.05.2024.
//

import Foundation
import UIKit

class Builder {
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
