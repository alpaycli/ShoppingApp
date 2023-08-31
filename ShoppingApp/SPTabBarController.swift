//
//  SPTabBarController.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 30.08.23.
//

import UIKit

class SPTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createClothesVC(), createProductsVC()]
    }
    

    func createClothesVC() -> UINavigationController {
        let searchVC = ClothesVC()
        searchVC.title = "Clothes"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createProductsVC() -> UINavigationController {
        let productsVC = ProductsVC()
        productsVC.title = "Products"
        productsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: productsVC)
    }

}
