//
//  ForgotPasswordRouter.swift
//  testproject1
//
//  Created by Guest Acc on 14.05.2024.
//

import Foundation
import UIKit

class ForgotPasswordRouter {
    weak var view: UIViewController?
    
    func sendCodeDidTapped() {
//        view?.dismiss(animated: true)
        view?.present(ConfirmCodeViewController(), animated: true)
    }
}
