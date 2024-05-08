//
//  Cat.swift
//  testproject1
//
//  Created by Guest Acc on 18.04.2024.
//

import Foundation

struct Cat: Codable, Hashable {
    
    struct Breed: Codable, Hashable {
        let id: String
        let name: String
        let origin: String
    }
    let id: String
    let catImageUrl: String
    let breeds: [Breed]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case catImageUrl = "url"
        case breeds
    }
}
