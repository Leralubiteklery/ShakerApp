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
    
    func addToFavourites(_ drinkId: String) {
        var favouriteIds = fetchFavouriteIds()
        
        if !favouriteIds.contains(drinkId){
            favouriteIds.append(drinkId)
            defaults.set(favouriteIds, forKey: favouriteKey)
        }
    }
    
    func fetchFavouriteIds() -> [String] {
        defaults.stringArray(forKey: favouriteKey) ?? []
    }
    
    func isFavourite(_ drinkId: String) -> Bool {
        fetchFavouriteIds().contains(drinkId)
    }
    
    func removeFromFavourites(_ drinkId: String) {
        var favouriteIds = fetchFavouriteIds()
        favouriteIds.removeAll { $0 == drinkId }
        defaults.set(favouriteIds, forKey: favouriteKey)
    }
    
//    func setFavouriteStatus(for drinkId: String, with status: Bool) {
//        defaults.set(status, forKey: drinkId)
//    }
//    
//    func getFavouriteStatus(for drinkId: String) -> Bool {
//        defaults.bool(forKey: drinkId)
//    }
}
