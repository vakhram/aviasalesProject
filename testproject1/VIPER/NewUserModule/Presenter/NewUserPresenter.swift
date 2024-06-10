//
//  NewUserPresenter.swift
//  testproject1
//
//  Created by Guest Acc on 19.05.2024.
//

import Foundation

final class NewUserPresenter {
    
    var view: NewUserViewController?
    let interactor: NewUserInteractor
    var router: NewUserRouter?
    
    init(interactor: NewUserInteractor) {
        self.interactor = interactor
    }
    
    func createAccountButtonDidTapped(username: String?, email: String?, password: String?) {
        if (interactor.checkData(username: username, email: email, password: password)) {
            router?.didCreatedAccount()
        }
    }
}
