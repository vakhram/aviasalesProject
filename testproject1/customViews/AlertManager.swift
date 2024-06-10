//
//  AlertManager.swift
//  testproject1
//
//  Created by Guest Acc on 10.06.2024.
//

import Foundation
import UIKit

class AlertManager {
    private static func showBasicAlert(on vc: UIViewController, with title: String, and message: String?) {
        Task {
            let alert = await UIAlertController(title: title, message: message, preferredStyle: .alert)
            await alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            await vc.present(alert, animated: true)
        }
    }
}

extension AlertManager {
    public static func showEmailValidationError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Invalid Email", and: "Please enter a valid email and try again")
    }
    public static func showAuthError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "User already exists", and: "User with this name already exists, please try again")
    }
    public static func showUserNameValidationError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Invalid Username", and: "Please enter a valid username and try again")
    }
    public static func showPasswordValidationError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Invalid Password", and: "Please enter a valid password and try again")
    }
}
