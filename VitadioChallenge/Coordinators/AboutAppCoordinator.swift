//
//  AboutAppCoordinator.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import UIKit

final class AboutAppCoordinator: Coordinator {
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}

extension AboutAppCoordinator {
    func start() {
        let vc = AboutAppViewController()
        
        let navVc = UINavigationController(rootViewController: vc)
        
        navigationController?.present(navVc, animated: true, completion: nil)
    }
}
