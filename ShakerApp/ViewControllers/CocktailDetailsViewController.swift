//
//  CocktailDetailsViewController.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 16.05.25.
//

import UIKit

class CocktailDetailsViewController: UIViewController {

    private var spinnerView = UIActivityIndicatorView()
    var drinkDetails: DrinkDetails!
    var cocktailID: String?
    
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var listOfIngridientsLabel: UILabel!
    @IBOutlet weak var listOfInstructionsLabel: UILabel!
    @IBOutlet weak var isFavouriteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCocktailDetails()
        showSpinner(in: view)
    }

    @IBAction func isFavouriteButtonTapped(_ sender: Any) {
    }
    
    // MARK: - Networking
    func fetchCocktailDetails() {
        guard let id = cocktailID else {
            return
        }
        
        let url = Link.cocktailDetails.rawValue + id
        print(url)
        
        NetworkManager.shared.fetch(DrinkDetailsWrapper.self, from: url) { [weak self] result in
            switch result {
            case .success(let wrapper):
                guard let drink = wrapper.drinks.first else {
                    return
                }
                DispatchQueue.main.async {
                    self?.drinkDetails = drink
                    self?.updateUI()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchCocktailImage() {
        NetworkManager.shared.fetchImage(from: drinkDetails.imageURL) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.cocktailImage.image = UIImage(data: imageData)
                self?.spinnerView.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateUI() {
        listOfIngridientsLabel.text = drinkDetails.convertToString(drinkDetails.ingridients)
        listOfInstructionsLabel.text = drinkDetails.instructions
        navigationItem.title = drinkDetails.name
        fetchCocktailImage()
    }
    
    private func showSpinner(in view: UIView) {
        spinnerView = UIActivityIndicatorView(style: .large)
        spinnerView.color = .black
        spinnerView.center = cocktailImage.center
        spinnerView.hidesWhenStopped = true
        
        view.addSubview(spinnerView)
        spinnerView.startAnimating()
    }
}
