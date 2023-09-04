//
//  SPBorderedButton.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 04.09.23.
//

import UIKit

class SPBorderedButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.label, for: .normal)
        layer.cornerRadius = 4.0
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .black, width: .condensed)
        backgroundColor = .clear
        layer.borderColor = UIColor(named: "darkGreen")?.cgColor
        layer.borderWidth = 2.0
    }
    
    func set(title: String) {
        self.setTitle(title, for: .normal)
    }

}
