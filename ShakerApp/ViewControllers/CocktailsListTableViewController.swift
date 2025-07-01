//
//  CoctailsListTableViewController.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 9.05.25.
//

import UIKit

class CocktailsListTableViewController: UITableViewController {
    
    private var listOfCocktails: ListOfCocktails?

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
    
//    MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDrink = listOfCocktails?.drinks[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: selectedDrink)
    }
    
//    MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard
        let cocktailsDetailsVC = segue.destination as? CocktailDetailsViewController,
        let selectedDrink = sender as? Drink else { return }
        
        cocktailsDetailsVC.cocktailID = selectedDrink.id
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
