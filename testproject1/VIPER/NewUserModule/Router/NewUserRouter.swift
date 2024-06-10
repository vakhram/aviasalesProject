//
//  NewUserRouter.swift
//  testproject1
//
//  Created by Guest Acc on 19.05.2024.
//

import Foundation
import UIKit

final class NewUserRouter {
    weak var view: UIViewController?
    
    func didCreatedAccount() {
        view?.dismiss(animated: true)
    }
}
