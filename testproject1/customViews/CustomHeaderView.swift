//
//  CustomHeaderView.swift
//  testproject1
//
//  Created by Guest Acc on 09.05.2024.
//

import UIKit

class CustomHeaderView: UIView {

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "aviasalesLogo")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "Error"
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Error"
        
        return label
    }()
    
    init(title: String, subtitle: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        subtitleLabel.text = subtitle
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(90)
            $0.height.equalTo(iconImageView.snp.width)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom).inset(-16)
            $0.centerX.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-16)
            $0.width.equalTo(250)
            $0.leading.equalToSuperview().offset(72)
        }
    }
}
