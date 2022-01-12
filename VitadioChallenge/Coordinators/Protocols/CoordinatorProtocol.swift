//
//  CoordinatorProtocol.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import Foundation

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
