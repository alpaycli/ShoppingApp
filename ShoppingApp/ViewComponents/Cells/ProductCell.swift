//
//  ProductCell.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 30.08.23.
//

import UIKit

class ProductCell: UICollectionViewCell {
    static let reuseId = "ProductCell"
    
    private let productImageView = ItemImageView(frame: .zero)
    private let priceLabel = SPTitleLabel(textAlignment: .left, fontSize: 16)
    private let nameLabel = SPTitleLabel(textAlignment: .left, fontSize: 18)
    private let descriptionLabel = SPBodyLabel(textAlignment: .left)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(product: Product) {
        productImageView.downloadImage(fromURL: product.thumbnail)
        priceLabel.text = "$\(product.price)"
        nameLabel.text = product.title
        descriptionLabel.text = product.description
        descriptionLabel.numberOfLines = 2
    }
    
    
    private func configure() {
        addSubviews(productImageView, priceLabel, nameLabel, descriptionLabel)
        
        let rightSideComponents = [priceLabel, nameLabel, descriptionLabel]
        let padding: CGFloat = 8
        
        for component in rightSideComponents {
            NSLayoutConstraint.activate([
                component.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: padding),
                component.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            ])
        }
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            productImageView.widthAnchor.constraint(equalToConstant: 80),
            productImageView.heightAnchor.constraint(equalToConstant: 100),
            
            priceLabel.topAnchor.constraint(equalTo: productImageView.topAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 3),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
}

