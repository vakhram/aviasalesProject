//
//  NetworkManager.swift
//  testproject1
//
//  Created by Guest Acc on 09.04.2024.
//

import Foundation
import UIKit


class ImageService {
    static let cache: NSCache<NSURL, NSData> = {
        
       let myCache = NSCache<NSURL, NSData>()
        myCache.countLimit = 20
        
        return myCache
    }()
    static func downloadImage(by urlString: String) async throws -> UIImage? {
        guard let url = URL(string: urlString) else { return nil }
        
        if let imageData = cache.object(forKey: url as NSURL) {
            return UIImage(data: imageData as Data)
        }
        
        let imageDataResponse = try await URLSession.shared.data(from: url)
        
        cache.setObject(imageDataResponse.0 as NSData, forKey: url as NSURL)
        
        return UIImage(data: imageDataResponse.0)
    }
}
class NetworkManager {
    private var session: URLSession
    
    lazy var jsonDecoder: JSONDecoder = {
        JSONDecoder()
    }()
    
    init(with configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func obtainCats() async throws -> [Cat] {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=10") else { return []}
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let responseData = try await session.data(for: urlRequest)
        
        return try jsonDecoder.decode([Cat].self, from: responseData.0)
    }
}
