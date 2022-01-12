//
//  MovieSearchViewModel.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import Foundation
import Combine

final class MovieSearchViewModel {
    private let movieService: MovieServiceProtocol
    
    private var disposeBag = Set<AnyCancellable>()
    private let dataLoadedSubject = PassthroughSubject<Result<String, ApiError>, Never>()
    
    var coordinator: SearchFlow?
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }
}

// MARK: - Public properties
extension MovieSearchViewModel {
    var dataLoaded: AnyPublisher<Result<String, ApiError>, Never> {
        return dataLoadedSubject.eraseToAnyPublisher()
    }
}

// MARK: - Public methods
extension MovieSearchViewModel {
    func searchMovie(byTitle title: String) {
        movieService.searchMovie(byTitle: title)
            .catch { [weak self]error -> Empty<MovieResponseBody, Never> in
                
                print(error.localizedDescription)
                self?.dataLoadedSubject.send(.failure(error))
                return Empty()
            }
            .sink(receiveValue: { [weak self] response in
                self?.dataLoadedSubject.send(.success(response.imdbID))
            })
            .store(in: &disposeBag)
    }
    
    func presentAboutAppScreen() {
        coordinator?.presentAboutApp()
    }
}
