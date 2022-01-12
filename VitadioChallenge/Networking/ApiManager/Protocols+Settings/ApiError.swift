//
//  ApiError.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import Foundation

enum ApiError: Error {
    case invalidURL
    case failedRequest
    case decodeError
}

extension ApiError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL Error"
        case .failedRequest:
            return "Request failed"
        case .decodeError:
            return "Error while decoding response"
        }
    }
}
