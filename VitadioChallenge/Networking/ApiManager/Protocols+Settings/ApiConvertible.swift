//
//  ApiConvertible.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import Foundation

struct URLComponentsConstants {
    static let host = "omdbapi.com"
    static let scheme = "https"
    static let title = "t"
    static let apiKey = "apikey"
    static let apiKeyValue = "5883e4d2"
}

protocol ApiConvertible {
    var baseURLComponents: URLComponents { get }
    var parameters: [URLQueryItem]? { get }
    var urlRequest: URLRequest? { get }
    
    func createUrlRequest() throws -> URLRequest
}

extension ApiConvertible {
    var baseURLComponents: URLComponents {
        var components = URLComponents()
        components.scheme = URLComponentsConstants.scheme
        components.host = URLComponentsConstants.host
        
        var queryItems: [URLQueryItem] = [URLQueryItem(name: URLComponentsConstants.apiKey, value: URLComponentsConstants.apiKeyValue)]
        
        if let otherParameters = parameters {
            queryItems += otherParameters
        }
        
        components.queryItems = queryItems
        
        return components
    }
    
    var parameters: [URLQueryItem]? {
        return nil
    }
    
    var httpBody: Data? {
        return nil
    }

    var urlRequest: URLRequest? {
        guard let url = baseURLComponents.url else { return nil }
        let request = URLRequest(url: url)

        return request
    }
}
