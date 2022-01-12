//
//  ApiManager.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import Foundation
import Combine

protocol ApiManager {
    func request<T: Decodable>(request: ApiConvertible) -> AnyPublisher<T, ApiError>
}
