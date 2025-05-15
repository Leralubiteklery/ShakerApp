//
//  NetworkManager.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 14.05.25.
//

import Foundation

enum Link: String {
    case cocktailsList = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch<T:Decodable>(_ type: T.Type, from url: String?, completion: @escaping (Result<T, NetworkError>) -> Void) {

        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                completion(.failure(.noData))
                print("no data")
                return
            }
            do {
                let type = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async{
                    completion(.success(type))
                }
            } catch {
                completion(.failure(.decodingError))
                print("decoding error")
            }
        }.resume()
    }
    
    
}
