//
//  BookFasterCell.swift
//  testproject1
//
//  Created by Guest Acc on 08.04.2024.
//

import UIKit

class BookFasterCell: UITableViewCell {
    
    let frontContentView = UIView()

//    let headerLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Book faster"
//        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        label.textColor = .white
//        label.textAlignment = .left
//        
//        return label
//    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Add passport to fill in passenger details in one click when booking"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 2
        
        return label
    }()
    
    let documentButton: UIButton = {
        let button = UIButton()
        button.setTitle("􀈷" + " Add document", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        print("BookFasterCell setupUI called")
        frontContentView.backgroundColor = .lightGray
        contentView.addSubview(frontContentView)
//        frontContentView.addSubview(headerLabel)
        frontContentView.backgroundColor = .white
        frontContentView.addSubview(detailLabel)
        frontContentView.addSubview(documentButton)
        
        frontContentView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height * 0.14)
            $0.width.equalToSuperview()
        }
//        headerLabel.snp.makeConstraints{
//            $0.top.equalToSuperview().inset(10)
//            $0.leading.equalToSuperview().inset(5)
//            $0.trailing.equalToSuperview()
//            $0.height.equalTo(35)
//        }
        detailLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(5)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(40)
        }
        documentButton.snp.makeConstraints{
            $0.top.equalTo(detailLabel.snp.bottom).inset(-15)
            $0.leading.equalTo(detailLabel.snp.leading)
            $0.trailing.equalTo(frontContentView.snp.trailing).inset(12)
            $0.bottom.equalTo(frontContentView.snp.bottom).inset(4)
        }
    }
    
}
