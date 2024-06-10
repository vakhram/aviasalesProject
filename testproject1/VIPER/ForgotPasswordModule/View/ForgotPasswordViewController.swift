//
//  ForgotPasswordViewController.swift
//  testproject1
//
//  Created by Guest Acc on 11.05.2024.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    let contentView: ForgotPasswordView = .init()
    let customHeaderView: CustomHeaderView = .init(title: "Forgot Password?", subtitle: "Enter your email to get code")
    var presenter: ForgotPasswordPresenter?
    
    init(presenter: ForgotPasswordPresenter) {
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
        setupBindings()
    }
    
    private func setupUI() {
        contentView.addSubview(customHeaderView)
        
        customHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
    
    private func setupBindings() {
        contentView.sendCodeButton.addTarget(self, action: #selector(sendCodeButtonDidTapped), for: .touchUpInside)
    }
    
    @objc
    private func sendCodeButtonDidTapped() {
        presenter?.sendCodeButtonDidTapped(email: contentView.emailTextField.text)
    }
}
