//
//  FavouritesTableViewController.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 9.05.25.
//

import UIKit

class FavouritesTableViewController: BaseCocktailListTableViewController {
    
    private var favouriteCocktails: [Drink] = []
    
    override var cocktails: [Drink] {
        favouriteCocktails
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFavouriteCocktails()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func fetchFavouriteCocktails() {
        favouriteCocktails = DataManager.shared.getFavouriteCocktails()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favouriteCocktails.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        let drink = favouriteCocktails[indexPath.row]
        
        cell.configure(with: drink)
        cell.cocktailImage.layer.cornerRadius = 20
        return cell
    }
}
