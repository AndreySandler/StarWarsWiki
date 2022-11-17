//
//  CharactersViewController.swift
//  StarWarsWiki
//
//  Created by Andrey Sandler on 16.11.2022.
//

import UIKit

class CharactersViewController: UITableViewController {
    // MARK: - Private Properties
    private var starWarsCharacters: StarWarsCharacters?
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacter(from: Link.starWarsWikiApi.rawValue)
    }
    
    // MARK: - TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWarsCharacters?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "charactersList", for: indexPath)
        let character = starWarsCharacters?.results[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = character?.name
        cell.contentConfiguration = content

        return cell
    }
    
    // MARK: - Private Methods
    private func fetchCharacter(from url: String) {
        NetworkManager.shared.fetch(StarWarsCharacters.self, from: url) { [weak self] result in
            switch result {
            case .success(let characters):
                self?.starWarsCharacters = characters
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}