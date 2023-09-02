//
//  APIService.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 30.08.23.
//

import Foundation

class APIService {
    static let shared = APIService()
    private init() { }
    
    func fetch<T: Decodable>(_ type: T.Type, url: URLRequest?, completion: @escaping(Result<T, APIError>) -> Void) {
        
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
       
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let decodedItems = try decoder.decode(type, from: data)
                    completion(Result.success(decodedItems))
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }

        }
        task.resume()
        
    }
}

enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        // for user
        switch self {
        case .badURL, .parsing, .unknown:
            return "Something went wrong"
        case .badResponse(_):
            return "Sorry, your connection lost with our server"
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong"
        }
    }
    
    var description: String {
        // for debugging
        switch self {
        case .badURL:
            return "Invalid URL"
        case .parsing(let error):
            return "parsing error: \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            return "Bad response with \(statusCode)"
        case .url(let error):
            return error?.localizedDescription ?? "url session over"
        case .unknown:
            return "Something went wrong"
        }
    }
}

enum SPError: String, Error {
    case invalidUsername = "Entered username is not valid. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "Invalid data from the server. Please try again."
    case unableToFavorite = "Something wrong with favoriting this user. Please try again."
    case alreadyInFavorite = "You have already favorited this item."
}

