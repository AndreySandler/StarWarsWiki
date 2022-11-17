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
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
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
    Hair Color: \(hair_color)
    Eye Color: \(eye_color)
    Skin Color: \(skin_color)
    Birth Year: \(birth_year)
    Homeworld: \(homeworld)
    """
    }
}

enum codingKeys: String, CodingKey {
    case hairColor = "hair_color"
    case skinColor = "skin_color"
    case eyeColor = "eye_color"
    case birthYear = "birth_year"
}

enum Link: String {
    case starWarsWikiApi = "https://swapi.py4e.com/api/people"
}
