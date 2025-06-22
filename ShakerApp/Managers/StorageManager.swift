//
//  StorageManager.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 22.06.25.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let defaults = UserDefaults.standard
    private let favouriteKey = "favouriteKey"
    
    private init() {}
    
    func save(drinkId: String) {
        var favouriteIds = fetchFavouriteIds()
        favouriteIds.append(drinkId)
        defaults.set(favouriteIds, forKey: favouriteKey)
    }
    
    func fetchFavouriteIds() -> [String] {
        if let favouriteIds = defaults.value(forKey: favouriteKey) as? [String] {
            return favouriteIds
        }
        return []
    }
    
    func deleteId(at index: Int) {
        var favouriteIds = fetchFavouriteIds()
        favouriteIds.remove(at: index)
        defaults.set(favouriteIds, forKey: favouriteKey)
    }
}
