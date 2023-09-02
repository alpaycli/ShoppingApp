//
//  Clothe.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 30.08.23.
//

import Foundation

struct ProductResponse: Codable {
    let products: [Product]
}

struct Product: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
    
    static let example = Product(id: 1, title: "Iphone 14", description: "Nice phone.", price: 300, discountPercentage: 10.0, rating: 4.5, stock: 100, brand: "Apple", category: "smartphones", thumbnail: "https://i.dummyjson.com/data/products/1/thumbnail.jpg", images: [])
}

