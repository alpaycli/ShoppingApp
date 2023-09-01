//
//  HeaderItemCell.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 31.08.23.
//

import UIKit

class HeaderItemCell: UICollectionViewCell {
    static let reuseId = "headerItemCell"
    
    private let imageView = UIImageView()
    private let titleLabel = SPTitleLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(type: ProductType) {
        switch type {
        case .smartphones:
            imageView.image = UIImage(systemName: "iphone.gen1")
        case .laptops:
            imageView.image = UIImage(systemName: "macbook.and.ipad")
        case .womensDresses:
            imageView.image = UIImage(systemName: "tshirt")
        case .tops:
            imageView.image = UIImage(systemName: "comb")
        case .skincare:
            imageView.image = UIImage(systemName: "nose")
        default: return
        }
        
        imageView.tintColor = .label
        titleLabel.text = type.rawValue
    }
    
    private func configure() {
        addSubviews(imageView, titleLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
