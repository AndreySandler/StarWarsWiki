//
//  CharacterDetailViewController.swift
//  StarWarsWiki
//
//  Created by Andrey Sandler on 17.11.2022.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var characterDetailTextView: UITextView!
    
    // MARK: - Public Properties
    var character: Character!

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = character.name
        characterDetailTextView.text = character?.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episodesVC = segue.destination as? FilmsViewController else { return }
        
        episodesVC.character = character
    }
}
