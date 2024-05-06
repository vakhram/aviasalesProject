//
//  TableViewCell.swift
//  testproject1
//
//  Created by Guest Acc on 22.03.2024.
//

import UIKit

final class PresentViewCell: UITableViewCell {
    private lazy var abbreviatedName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        
        return label
    }()
    
    var fullName: UILabel = {
        let label  = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        
        return label
    }()
    
    var frontContentView = UIView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAppereance()
    }

    func configure(abbreviatedText: String, fullText: String) {
        abbreviatedName.text = abbreviatedText
        fullName.text = fullText
        self.backgroundColor = .darkGray
    }

    private func setupAppereance() {
        contentView.addSubview(frontContentView)
        frontContentView.addSubview(abbreviatedName)
        frontContentView.addSubview(fullName)
        
        
        frontContentView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalToSuperview()
        }
        abbreviatedName.snp.makeConstraints {
            $0.top.equalToSuperview().inset(-25)
            $0.leading.equalToSuperview().inset(55)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
        fullName.snp.makeConstraints {
            $0.top.equalTo(abbreviatedName.snp.top)
            $0.leading.equalTo(abbreviatedName.snp.trailing).inset(250)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
        
    }
}
