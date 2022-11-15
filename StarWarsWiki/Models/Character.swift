//
//  Character.swift
//  StarWarsWiki
//
//  Created by Andrey Sandler on 15.11.2022.
//

import Foundation

struct Character: Decodable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
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
    Skin Color: \(skinColor)
    Eye Color: \(eyeColor)
    Birth Year: \(birthYear)
    Homeworld: \(homeworld)
    """
    }
}

enum codingKeys: String, CodingKey {
    case hairColor = "hair_color"
    case skinColor = "skin_color"
    case eyeColor = "eyeColor"
    case birthYear = "birth_year"
}
