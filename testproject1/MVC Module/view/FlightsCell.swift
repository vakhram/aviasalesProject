//
//  Firstcell.swift
//  testproject1
//
//  Created by Guest Acc on 03.03.2024.
//

import UIKit

class FlightsCell: UITableViewCell {

    private let flightLabel = UILabel()
    private let priceLabel = UILabel()
    private let dateLabel = UILabel()
    private let weekDayLabel = UILabel()
    private let frontContentView = UIView()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAppearance()
    }
    
    public func configure(flightName: String,
                          price: Double,
                          date: String,
                          weekDay: String,
                          cellBackground: UIColor) {
        guard let currencyMark = SelectedCurrency(rawValue: userDefaults.integer(forKey: "selectedCurrency"))?.currencyMark else {return}
        flightLabel.text = flightName
        priceLabel.text = String(price) + " " + String(currencyMark)
        dateLabel.text = date
        weekDayLabel.text = weekDay
        contentView.backgroundColor = cellBackground
        self.backgroundColor = cellBackground
        self.frontContentView.backgroundColor = .white
    }
    
    private func setupAppearance() {
        
        priceLabel.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        flightLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        frontContentView.layer.cornerRadius = 50
        frontContentView.layer.borderWidth = 1
        frontContentView.layer.borderColor = UIColor.black.cgColor

        contentView.addSubview(frontContentView)
        frontContentView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(358)
            $0.height.equalTo(150)
        }
        
        frontContentView.addSubview(flightLabel)
        flightLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(64)
            $0.leading.equalToSuperview().inset(16)
        }
        
        frontContentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(64)
            $0.leading.equalToSuperview().inset(220)
        }
        
        frontContentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints{
            $0.top.equalTo(flightLabel.snp.bottom).inset(-4)
            $0.leading.equalTo(flightLabel.snp.leading)
        }
        
        frontContentView.addSubview(weekDayLabel)
        weekDayLabel.snp.makeConstraints{
            
            $0.top.equalTo(priceLabel.snp.bottom).inset(-4)
            $0.leading.equalTo(priceLabel.snp.leading)
            
        }
    }
}
