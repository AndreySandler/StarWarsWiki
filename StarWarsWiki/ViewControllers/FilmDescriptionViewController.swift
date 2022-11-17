//
//  FilmDescriptionViewController.swift
//  StarWarsWiki
//
//  Created by Andrey Sandler on 17.11.2022.
//

import UIKit

class FilmDescriptionViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var filmDescriptionLabel: UILabel!
    
    // MARK: - Public Properties
    var film: Film!
    
    // MARK: - Private Properties
    private var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCharacters()
        
        title = film.title
        filmDescriptionLabel.text = film.description
    }
    
    // MARK: - Private Properties
    private func setupCharacters() {
        film.characters.forEach { character in
            NetworkManager.shared.fetch(Character.self, from: character) { [weak self] result in
                switch result {
                case .success(let character):
                    self?.characters.append(character)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}


// MARK: - TableViewDataSource
extension FilmDescriptionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        film.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "charactersInFilm", for: indexPath)
        var content = cell.defaultContentConfiguration()

        let characterURL = film.characters[indexPath.row]
        NetworkManager.shared.fetch(Character.self, from: characterURL) { [weak self] result in
            switch result {
            case .success(let character):
                self?.characters.append(character)
                content.text = character.name
                cell.contentConfiguration = content
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return cell
    }
}

extension FilmDescriptionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
