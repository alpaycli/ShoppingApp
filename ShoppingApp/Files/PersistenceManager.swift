//
//  PersistenceManager.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 02.09.23.
//

import Foundation

enum ActionType {
    case add
    case remove
}

class PersistenceManager {
    static let shared = PersistenceManager()
    private init() { }
    
    private let defaults = UserDefaults.standard
    private let favoritesKey = "favorites"
    
    func updateWith(_ product: Product, actionType: ActionType, completion: @escaping(SPError?) -> Void ) {
        loadFavorites { result in
            switch result {
            case .success(var favorites):
                
                switch actionType {
                case .add:
                    if favorites.contains(product) {
                        completion(.alreadyInFavorite)
                        return
                    }
                    
                    favorites.append(product)
                case .remove:
                    favorites.removeAll(where: { $0.title == product.title } )
                }
                
                completion(self.saveFavorites(followers: favorites))
                
            case .failure(let error):
                completion(error)
            }
        }
    }

    
    func loadFavorites(completion: @escaping(Result<[Product], SPError>) -> Void) {
        guard let data = defaults.object(forKey: favoritesKey) as? Data else {
            completion(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedItems = try decoder.decode([Product].self, from: data)
            completion(.success(decodedItems))
        } catch {
            completion(.failure(.unableToComplete))
        }
    }
    
    private func saveFavorites(followers: [Product]) -> SPError? {
                
        do {
            let encoder = JSONEncoder()
            let encodedItems = try encoder.encode(followers)
            defaults.set(encodedItems, forKey: favoritesKey)
            return nil
        } catch {
            return .unableToComplete
        }
    }
}
