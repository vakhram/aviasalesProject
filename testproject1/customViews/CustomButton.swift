//
//  CustomButton.swift
//  testproject1
//
//  Created by Guest Acc on 09.05.2024.
//

import UIKit

class CustomButton: UIButton {
    
    enum FontSize {
        case big
        case medium
        case small
    }
    
    init(title: String, hasBackground: Bool = false, buttonSize: FontSize) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        let background: UIColor = hasBackground ? .systemBlue : .white
        let textColor: UIColor = hasBackground ? .white : .systemBlue
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = background
        
        switch buttonSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        case .medium:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
