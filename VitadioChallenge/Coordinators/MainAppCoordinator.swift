//
//  MainAppCoordinator.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import UIKit

final class MainAppCoordinator: Coordinator {
    private weak var navigationController: UINavigationController?
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
}

extension MainAppCoordinator {
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
//        window.backgroundColor = .black
        window.makeKeyAndVisible()
        self.navigationController = navigationController
        
        let movieSearchCoordinator = MovieSearchCoordinator(navigationController: navigationController)
        coordinate(to: movieSearchCoordinator)
    }
}
