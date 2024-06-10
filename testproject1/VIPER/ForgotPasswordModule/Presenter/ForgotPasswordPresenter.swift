//
//  ForgotPasswordPresenter.swift
//  testproject1
//
//  Created by Guest Acc on 14.05.2024.
//

import Foundation


class ForgotPasswordPresenter {
    var interactor: ForgotPasswordInteractor
    var router: ForgotPasswordRouter?
    var view: ForgotPasswordViewController?
    
    init(interactor: ForgotPasswordInteractor) {
        self.interactor = interactor
    }
    func sendCodeButtonDidTapped(email: String?) {
        if (interactor.checkData(email: email)) {
            router?.sendCodeDidTapped()
        }
    }
}
