//
//  MoviewSearchViewController.swift
//  VitadioChallenge
//
//  Created by Daniel Brezina on 12.01.2022.
//

import UIKit
import Combine

final class MoviewSearchViewController: UIViewController {
    private weak var searchTextField: UITextField!
    private weak var searchButton: UIButton!
    
    var viewModel: MovieSearchViewModel!
    
    private var disposeBag = Set<AnyCancellable>()
}

// MARK: - Life cycle
extension MoviewSearchViewController {
    override func loadView() {
        super.loadView()
        
        layout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        prepareViewModel()
    }
}

// MARK: - Private methods for UI
private extension MoviewSearchViewController {
    func prepareUI() {
        view.backgroundColor = .systemBackground
        
        prepareNavigationItem()
        prepareTextField()
        prepareSearchButton()
    }
    
    func prepareNavigationItem() {
        navigationItem.title = "Hledat film"
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showAboutApp(_:)))
        navigationItem.rightBarButtonItem = barButton
    }
    
    func prepareTextField() {
        searchTextField.placeholder = "Hledat"
        searchTextField.layer.borderWidth = 0.5
        searchTextField.layer.borderColor = UIColor.gray.cgColor
        searchTextField.returnKeyType = .go
        searchTextField.delegate = self
    }
    
    func prepareSearchButton() {
        searchButton.setTitle("Hledat", for: .normal)
        searchButton.setTitleColor(.blue, for: .normal)
        searchButton.addTarget(self, action: #selector(handleSearchTap(_:)), for: .touchUpInside)
    }
}

// MARK: - Prepare methods for View model
private extension MoviewSearchViewController {
    func prepareViewModel() {
        bindDataLoaded()
    }
    
    func bindDataLoaded() {
        viewModel.dataLoaded
            .sink { [weak self]result in
                switch result {
                case .failure:
                    //Display error (not part of challenge)
                    break
                case .success(let imdbID):
                    self?.displayMovie(withID: imdbID)
                }
            }
            .store(in: &disposeBag)
    }
}

// MARK: - Actions
private extension MoviewSearchViewController {
    @objc func handleSearchTap(_ sender: UIButton) {
        searchMovie()
    }
    
    @objc func showAboutApp(_ sender: UIBarButtonItem) {
        viewModel.presentAboutAppScreen()
    }
    
    func searchMovie() {
        guard let text = searchTextField.text, !text.isEmpty else { return }
        
        viewModel.searchMovie(byTitle: text)
    }
    
    func displayMovie(withID imdbId: String) {
        // TODO: CHALENGE - display detail screen for this movie
        print("display detail screen for movie with imdb ID \(imdbId)")
    }
}

extension MoviewSearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovie()
        
        return true
    }
}

// MARK: - Auto Layout
private extension MoviewSearchViewController {
    func layout() {
        layoutSearchViews()
    }
    
    func layoutSearchViews() {
        let textfield = UITextField()
        view.addSubview(textfield)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            textfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        self.searchTextField = textfield
        
        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: textfield.leadingAnchor),
            button.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: textfield.trailingAnchor)
        ])
        self.searchButton = button
    }
}
