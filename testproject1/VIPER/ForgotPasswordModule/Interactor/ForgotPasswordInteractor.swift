//
//  ForgotPasswordInteractor.swift
//  testproject1
//
//  Created by Guest Acc on 14.05.2024.
//

import Foundation


class ForgotPasswordInteractor {
    var presenter: ForgotPasswordPresenter?
    
    func checkData(email: String?) -> Bool {
        guard let email = email else { return false }
        
        for c in email {
            if (c == "@") {
                return true
            }
        }
        return false
    }
}
