//
//  BagVC.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 04.09.23.
//

import UIKit

class BagVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
