//
//  MovieService.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import Foundation
import Combine

protocol MovieServiceProtocol {
    func searchMovie(byTitle: String) -> AnyPublisher<MovieResponseBody, ApiError>
}

final class MovieService: MovieServiceProtocol {
    private let apiManager: ApiManager
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
}

extension MovieService {
    func searchMovie(byTitle title: String) -> AnyPublisher<MovieResponseBody, ApiError> {
        return apiManager.request(request: SearchMovieRouter.searchMovie(title: title))
    }
}
