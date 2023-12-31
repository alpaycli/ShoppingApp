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
        viewControllers = [createClothesVC(), createProductsVC(), createBagVC()]
    }
    

    func createClothesVC() -> UINavigationController {
        let searchVC = ClothesVC()
        searchVC.title = "Clothes"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createProductsVC() -> UINavigationController {
        let favoritesVC = FavoritesVC()
        favoritesVC.title = "Products"
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
    
    func createBagVC() -> UINavigationController {
        let bagVC = BagVC()
        bagVC.title = "Bag"
        bagVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        return UINavigationController(rootViewController: bagVC)
    }

}
