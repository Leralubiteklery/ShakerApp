//
//  DataManager.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 1.07.25.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    var allCocktails: [Drink] = []
    
    func getFavouriteCocktails() -> [Drink] {
        let favouriteIds = StorageManager.shared.fetchFavouriteIds()
        return allCocktails.filter { favouriteIds.contains($0.id) }
    }
}
