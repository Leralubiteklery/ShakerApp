//
//  Cocktail.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 13.05.25.
//

import Foundation

struct ListOfCocktails:  Codable {
    let drinks: [Cocktail]
}

struct Cocktail: Codable {
    let name: String
//    let imageURL: URL
//    let instructions: String
//    let ingridients: [Ingridient]
    
    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
//        case image = "strDrinkThumb"
//        case instructions = "strInstructions"
//        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5,
//             strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10,
//             strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15
//        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5,
//             strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10,
//             strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15
    }
    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        name = try container.decode(String.self, forKey: .name)
//        instructions = try container.decode(String.self, forKey: .instructions)
//        imageURL = try container.decode(URL.self, forKey: .image)
//        
//        var tempIngridients: [Ingridient] = []
//        
//        for number in 1...15 {
//            let ingridientKey = CodingKeys(stringValue: "strIngredient\(number)")!
//            let measureKey = CodingKeys(stringValue: "strMeasure\(number)")!
//            
//            let ingridient = try container.decodeIfPresent(String.self, forKey: ingridientKey)
//            let measure = try container.decodeIfPresent(String.self, forKey: measureKey)
//            
//            if let ingridient = ingridient, !ingridient.isEmpty {
//                tempIngridients.append(Ingridient(name: ingridient, measure: measure ?? ""))
//            }
//        }
//        
//        ingridients = tempIngridients
//    }
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        
//        try container.encode(name, forKey: .name)
//       try container.encode(instructions, forKey: .instructions)
//        try container.encode(imageURL, forKey: .image)
//
//        for (index, ingridient) in ingridients.enumerated() where index < 15 {
//            let ingridientKey = CodingKeys(stringValue: "strIngredient\(index + 1)")!
//            let measureKey = CodingKeys(stringValue: "strMeasure\(index + 1)")!
//            
//            try container.encode(ingridient.name, forKey: ingridientKey)
//            try container.encode(ingridient.measure, forKey: measureKey)
//        }
//    }
}

//struct Ingridient {
//    let name: String
//    let measure: String
//}
