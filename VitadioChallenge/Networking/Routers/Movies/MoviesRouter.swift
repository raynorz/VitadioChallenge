//
//  MoviesRouter.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import Foundation

enum SearchMovieRouter: ApiConvertible {
    case searchMovie(title: String)
}

extension SearchMovieRouter {

    var parameters: [URLQueryItem]? {
        switch self {
        case .searchMovie(let title):
            let queryItem = URLQueryItem(name: URLComponentsConstants.title, value: "\(title)")
            return [queryItem]
        default:
            return nil
        }
    }
    
    func createUrlRequest() throws -> URLRequest {
        guard var urlRequest = urlRequest else {
            throw ApiError.invalidURL
        }
        
        return urlRequest
    }
    
}
