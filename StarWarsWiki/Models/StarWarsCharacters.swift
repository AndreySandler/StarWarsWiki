//
//  Character.swift
//  StarWarsWiki
//
//  Created by Andrey Sandler on 15.11.2022.
//

import Foundation

struct StarWarsCharacters: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Character]
}

struct Character: Decodable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    var homeworld: String
    let url: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    
    var description: String {
        """
    Name: \(name)
    Gender: \(gender)
    Height: \(height)
    Mass: \(mass)
    Hair Color: \(hairColor)
    Eye Color: \(eyeColor)
    Skin Color: \(skinColor)
    Birth Year: \(birthYear)
    """
    }
}

struct Film: Decodable {
    
    let title: String
    let releaseDate: String
    let characters: [String]
    
    var description: String {
        """
    Title: \(title)
    Release Date: \(releaseDate)
    """
    }
}

struct HomeWorld: Decodable {
    let name: String
}


enum Link: String {
    case starWarsWikiApi = "https://swapi.py4e.com/api/people"
}
