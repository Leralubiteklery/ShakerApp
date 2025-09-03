//
//  BaseCocktailListTableViewController.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 1.07.25.
//

import UIKit

class BaseCocktailListTableViewController: UITableViewController {
    
    var cocktails: [Drink] {
        return []
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //    MARK: - UITableViewDelegate
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedDrink = cocktails[indexPath.row]
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
