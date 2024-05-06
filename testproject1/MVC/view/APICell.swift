//
//  APICell.swift
//  testproject1
//
//  Created by Guest Acc on 18.04.2024.
//

import UIKit

protocol ApiCellDelegate: AnyObject {
    func detailButtonTapped()
}

class APICell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var frontContentView = UIView()
    
    private lazy var catNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private lazy var catBreedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private lazy var catImageView: UIImageView = {
       let iv = UIImageView()
        iv.layer.cornerRadius = 100/2
        iv.layer.masksToBounds = true

        return iv
        
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Get Info", for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        
        return button
        
    }()
    
    
    
   weak var delegate: ApiCellDelegate?
    
    func configure(with cat: Cat) {
        catNameLabel.text = cat.id
        Task {
           let image = try await ImageService.downloadImage(by:cat.catImageUrl)
            catImageView.image = image
        }
//        catImageView.image = cat.url.
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        catImageView.image = nil
    }
    private func setupUI() {
        
        self.contentView.addSubview(frontContentView)
        self.frontContentView.addSubview(catNameLabel)
        self.frontContentView.addSubview(catBreedLabel)
        self.frontContentView.addSubview(catImageView)
        self.frontContentView.addSubview(button)
        
        
        
        frontContentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
            
        }
        catImageView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(100)
            $0.top.equalTo(catNameLabel.snp.bottom).inset(-8)
            $0.leading.equalTo(catNameLabel).inset(16)
            $0.bottom.equalToSuperview().offset(-16)
        }
        catNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(24)
        }
        button.snp.makeConstraints {
            $0.leading.equalTo(catNameLabel.snp.trailing)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            
            
        }
    }
    @objc
    private func buttonTapped(){
        print("Button Tapped")
        delegate?.detailButtonTapped()
    }
}

