//
//  CharacterFromFilmViewController.swift
//  StarWarsWiki
//
//  Created by Andrey Sandler on 17.11.2022.
//

import UIKit

class CharacterFromFilmViewController: UIViewController {
    
    // MARK: - Public Properties
    var character: Character!
    
    // MARK: - IBOutlets
    @IBOutlet var characterDescriptionTextView: UITextView!
    
    // MARK: - OverrideMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterDescriptionTextView.text = character.description
    }
}
