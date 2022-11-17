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
    var films: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
