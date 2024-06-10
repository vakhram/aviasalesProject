//
//  NewUserInteractor.swift
//  testproject1
//
//  Created by Guest Acc on 19.05.2024.
//

import Foundation

final class NewUserInteractor {
    
    weak var presenter: NewUserPresenter?
    var isCorrectData: Bool = false
    
    func checkData(username:String?, email: String?, password: String?) -> Bool{
        guard let username = username else { return false }
        guard let email = email else { return false }
        guard let password = password else { return false }

        for c in email {
            if (c == "@") {
                isCorrectData = true
            }
            isCorrectData = false
        }
        
        for c in password {
            if (c == "/" || c == "@" || c == " " || c == "?" || c == "#") {
                isCorrectData = false
            }
            isCorrectData = true
        }
        
        return isCorrectData
    }
}
