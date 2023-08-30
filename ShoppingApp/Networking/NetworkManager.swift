//
//  NetworkManager.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 30.08.23.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    let cache = NSCache<NSString, UIImage>()
    
    func downloadImage(urlString: String, completion: @escaping(UIImage?) -> Void ) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                  error == nil,
                  let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode),
                  let data = data,
                  let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            
            self.cache.setObject(image, forKey: cacheKey)
            
            completion(image)
        }
        
        task.resume()
    }
}
