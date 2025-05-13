//
//  Cocktail.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 13.05.25.
//

import Foundation

struct ListOfCocktails: Codable {
    let drinks: [Drink]
}

struct Drink: Codable {
    let name: String
    let image: URL
    let instructions: String
    let ingridients: [Ingridient]
    
    
}

struct Ingridient: Codable {
    let name: String
    let measure: String
}
