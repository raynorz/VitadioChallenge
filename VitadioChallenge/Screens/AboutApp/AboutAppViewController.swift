//
//  AboutAppViewController.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import UIKit
import Combine

final class AboutAppViewController: UIViewController {
    private weak var label: UILabel!
}

// MARK: - Life cycle
extension AboutAppViewController {
    override func loadView() {
        super.loadView()
        
        layout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
    }
}

// MARK: - Private methods for UI
private extension AboutAppViewController {
    func prepareUI() {
        view.backgroundColor = .systemBackground
        
        prepareNavigationItem()
        prepareLabel()
    }
    
    func prepareNavigationItem() {
        title = "O aplikaci"
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeView(_:)))
        navigationItem.leftBarButtonItem = barButton
    }
    
    func prepareLabel() {
        label.text = "Tato obrazovka slouží k ukázce práce s coordinatory."
        label.textAlignment = .center
        label.numberOfLines = 0
    }
}


// MARK: - Actions
private extension AboutAppViewController {
    @objc func closeView(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Auto Layout
private extension AboutAppViewController {
    func layout() {
        let label = UILabel()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        self.label = label
    }
}

