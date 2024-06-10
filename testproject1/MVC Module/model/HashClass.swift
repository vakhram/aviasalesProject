//
//  HashClass.swift
//  testproject1
//
//  Created by Guest Acc on 06.06.2024.
//

import Foundation
import CryptoKit

final class HashClass {
    static func HashPassword(password: String?) -> String? {
        guard let password = password else { return nil }
        let dataPassword = Data(password.utf8)
        let hashedPassword = SHA256.hash(data: dataPassword)
        return hashedPassword.compactMap{String(format: "%02x", $0)}.joined()
    }
}
