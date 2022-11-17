//
//  EpisodesViewController.swift
//  StarWarsWiki
//
//  Created by Andrey Sandler on 17.11.2022.
//

import UIKit

class EpisodesViewController: UITableViewController {
    
    // MARK: - Public Properties
    var character: Character!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
}
