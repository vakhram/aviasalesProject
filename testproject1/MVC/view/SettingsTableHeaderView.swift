//
//  SettingsTableHeaderView.swift
//  testproject1
//
//  Created by Guest Acc on 29.03.2024.
//

import UIKit

class SettingsTableHeaderView: UIView {

    var boldLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = .white
        label.text = "Sign in to your profile"
        label.textAlignment = .center
        
        return label
    }()
    
    var lightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.text = "To contact support team and keep on prices for specific tickets"
        
        return label
    }()
    
    var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 20
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    private func setupUI() {
        print("setupUI is called")
        self.backgroundColor = .lightGray
        
        self.addSubview(boldLabel)
        self.addSubview(lightLabel)
        self.addSubview(signInButton)
        
        
        boldLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }
        lightLabel.snp.makeConstraints {
            $0.top.equalTo(boldLabel.snp.bottom).inset(-20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        signInButton.snp.makeConstraints {
            $0.top.equalTo(lightLabel.snp.bottom).inset(-25)
            $0.leading.equalTo(lightLabel.snp.leading)
            $0.trailing.equalTo(lightLabel.snp.trailing)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
    }
}
