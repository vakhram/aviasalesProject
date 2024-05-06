//
//  Currency.swift
//  testproject1
//
//  Created by Guest Acc on 22.03.2024.
//

import Foundation

enum SelectedCurrency: Int,CaseIterable {
    case usd
    case eur
    case rub
    
    var transferCurrency: Double {
        switch self{
        case .eur:
            return 99.71
        case .rub:
            return 1
        case .usd:
            return 92.26
        }
    }
    
    var currencyMark: Character{
        switch self{
        case .eur:
            return "€"
        case .usd:
            return "$"
        case .rub:
            return "₽"
        }
    }
    
    var abbreviatedText: String {
        switch self{
        case .eur:
            return "EUR"
        case .rub:
            return "RUB"
        case .usd:
            return "USD"
        }
    }
    var fullText: String {
        switch self{
        case .eur:
            return "Euro"
        case .rub:
            return "Russian rouble"
        case .usd:
            return "US Dollar"
        }
    }
}
