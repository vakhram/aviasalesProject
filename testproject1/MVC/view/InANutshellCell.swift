//
//  InANutshellCell.swift
//  testproject1
//
//  Created by Guest Acc on 01.04.2024.
//

import UIKit

class InANutshellCell: UICollectionViewCell {
    
    let cityImage: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = .darkGray
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        
        return iv
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        label.textAlignment = .left
        label.textColor = .white
        
        return label
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        label.textAlignment = .left
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - View life cyrcle 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration

    public func configure(image: UIImage, cityName: String, countryName: String, backGroundColor: UIColor){
        cityImage.image = image
        cityLabel.text = cityName
        countryLabel.text = countryName
        self.backgroundColor = backGroundColor
        self.layer.cornerRadius = 10
        self.setupUI()
    }
    
    // MARK: - UI SETUP
    
    private func setupUI(){
        self.addSubview(cityImage)
        self.addSubview(cityLabel)
        self.addSubview(countryLabel)
        
        cityImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30)
        }
        
        cityLabel.snp.makeConstraints{
            $0.top.equalTo(cityImage.snp.bottom)
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(15)
            $0.height.equalTo(20)
        }
        
        countryLabel.snp.makeConstraints{
            $0.top.equalTo(cityLabel.snp.bottom).inset(5)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(15)
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cityImage.image = nil
    }
}
