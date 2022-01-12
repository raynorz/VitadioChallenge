//
//  MovieSearchCoordinator.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import UIKit

protocol SearchFlow {
    func presentAboutApp()
}

final class MovieSearchCoordinator: Coordinator {
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}

extension MovieSearchCoordinator {
    func start() {
        let viewModel = MovieSearchViewModel(movieService: MovieService(apiManager: ApiCommunication()))
        viewModel.coordinator = self
        
        let vc = MoviewSearchViewController()
        vc.viewModel = viewModel
        
        navigationController?.setViewControllers([vc], animated: true)
    }
}

extension MovieSearchCoordinator: SearchFlow {
    func presentAboutApp() {
        let coordinator = AboutAppCoordinator(navigationController: navigationController)
        coordinate(to: coordinator)
    }
}
