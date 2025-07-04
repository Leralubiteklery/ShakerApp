//
//  CoctailsListTableViewController.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 9.05.25.
//

import UIKit

class CocktailsListTableViewController: BaseCocktailListTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCocktailsList()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfCocktails?.drinks.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        guard let drink = listOfCocktails?.drinks[indexPath.row] else { return UITableViewCell() }
        cell.configure(with: drink)
        
        cell.cocktailImage.layer.cornerRadius = 20

        return cell
    }
}

// MARK: - Networking
extension CocktailsListTableViewController {
    private func fetchCocktailsList() {
        NetworkManager.shared.fetch(ListOfCocktails.self, from: Link.cocktailsList.rawValue) { [weak self] result in
            switch result {
            case .success(let cocktails):
                self?.listOfCocktails = cocktails
                DataManager.shared.allCocktails = cocktails.drinks
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
