//
//  ForgotPasswordView.swift
//  testproject1
//
//  Created by Guest Acc on 11.05.2024.
//

import UIKit

class ForgotPasswordView: UIView {
    
    let emailTextField: CustomTextField = .init(authFieldType: .email)
    let sendCodeButton: CustomButton = .init(title: "Send Code", hasBackground: true, buttonSize: .big)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(emailTextField)
        addSubview(sendCodeButton)
        
        emailTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-124)
            $0.leading.equalToSuperview().offset(64)
            $0.trailing.equalToSuperview().offset(-64)
            $0.height.equalTo(50)
        }
        
        sendCodeButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).inset(-32)
            $0.leading.equalToSuperview().offset(96)
            $0.trailing.equalToSuperview().offset(-96)
            $0.height.equalTo(50)
        }
    }
}
