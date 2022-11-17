//
//  EpisodesViewController.swift
//  StarWarsWiki
//
//  Created by Andrey Sandler on 17.11.2022.
//

import UIKit

class FilmsViewController: UITableViewController {
    
    // MARK: - Public Properties
    var character: Character!
    
    // MARK: - Private Properties
    private var films: [Film] = []
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let film = films[indexPath.row]
        
        guard let filmDescriptionVC = segue.destination as? FilmDescriptionViewController else { return }
        filmDescriptionVC.film = film
    }
    
    // MARK: - TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        character.films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmsList", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let filmURL = character.films[indexPath.row]
        NetworkManager.shared.fetch(Film.self, from: filmURL) { [weak self] result in
            switch result {
            case .success(let film):
                self?.films.append(film)
                content.text = film.title
                cell.contentConfiguration = content
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        return cell
    }
}
