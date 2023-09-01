//
//  SecondSectionHeaderView.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 01.09.23.
//

import UIKit

class SecondSectionHeaderView: UICollectionReusableView {
        
    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "Laptops"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
