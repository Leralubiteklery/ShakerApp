//
//  CocktailDetailsViewController.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 16.05.25.
//

import UIKit

class CocktailDetailsViewController: UIViewController {

    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var listOfIngridientsLabel: UILabel!
    @IBOutlet weak var listOfInstructionsLabel: UILabel!
    
    var drinkDetails: DrinkDetails!
    var cocktailID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCocktailDetails()
    }

    // MARK: - Networking

    func fetchCocktailDetails() {
        guard let id = cocktailID else {
            print("no cocktail id")
            return
        }
        
        let url = Link.cocktailDetails.rawValue + id
        print(url)
        NetworkManager.shared.fetch(DrinkDetails.self, from: url) { [weak self] result in
            switch result {
            case .success(let cocktailDetails):
                self?.drinkDetails = cocktailDetails
                print(cocktailDetails)
                DispatchQueue.main.async {
                    self?.drinkDetails = cocktailDetails
                    self?.updateUI()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateUI() {
        listOfIngridientsLabel.text = drinkDetails.convertToString(drinkDetails.ingridients)
        listOfInstructionsLabel.text = drinkDetails.instructions
  
    }
}
