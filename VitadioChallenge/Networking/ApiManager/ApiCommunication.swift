//
//  ApiCommunication.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import Foundation
import Combine

final class ApiCommunication: ApiManager { }

extension ApiCommunication {
    func request<T>(request: ApiConvertible) -> AnyPublisher<T, ApiError> where T : Decodable {
        guard let urlRequest = try? request.createUrlRequest() else {
            return Fail(error: ApiError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .receive(on: RunLoop.main)
            .mapError { _ in ApiError.failedRequest }
            .flatMap { data in
                decode(data.data)}
            .eraseToAnyPublisher()
    }
}

internal func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, ApiError> {
    let decoder = JSONDecoder()
    return Just(data).decode(type: T.self, decoder: decoder)
        .mapError { _ in ApiError.decodeError }
        .eraseToAnyPublisher()
}
