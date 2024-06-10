//
//  NewUserViewController.swift
//  testproject1
//
//  Created by Guest Acc on 13.05.2024.
//

import UIKit

final class NewUserViewController: UIViewController {

    let contentView: NewUserView = .init()
    let headerView: CustomHeaderView = .init(title: "Create New Account", subtitle: "Fill up all fields below to create Account")
    var presenter: NewUserPresenter?
    
    init(presenter: NewUserPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addButtonsTargets()
    }
    
    private func setupUI() {
        contentView.addSubview(headerView)
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
    }
    
    private func addButtonsTargets() {
        contentView.createAccountButton.addTarget(self, action: #selector(createAccountButtonDidTapped), for: .touchUpInside)
    }
    
    @objc
    private func createAccountButtonDidTapped() {
        presenter?.createAccountButtonDidTapped(username: contentView.usernameTextField.text, email: contentView.emailTextField.text, password: contentView.passwordTextField.text)
    }
}
