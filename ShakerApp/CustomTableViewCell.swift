//
//  CustomTableViewCell.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 13.05.25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingridientsLabel: UILabel!
    
    func configure(with drink: Cocktail) {
        nameLabel.text = drink.name
        
        NetworkManager.shared.fetchImage(from: drink.imageURL) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.cocktailImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
