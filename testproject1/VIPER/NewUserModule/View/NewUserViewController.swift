//
//  NewUserViewController.swift
//  testproject1
//
//  Created by Guest Acc on 13.05.2024.
//

import UIKit

class NewUserViewController: UIViewController {

    let contentView: NewUserView = .init()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
