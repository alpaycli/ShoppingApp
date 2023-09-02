//
//  ProductCell.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 30.08.23.
//

import UIKit

class ProductCell: UICollectionViewCell {
    static let reuseId = "ProductCell"
    
    private let imageView = ItemImageView(frame: .zero)
    private let priceLabel = SPTitleLabel(textAlignment: .left, fontSize: 20)
    private let nameLabel = SPBodyLabel(textAlignment: .left)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(product: Product) {
        imageView.downloadImage(fromURL: product.thumbnail)
        priceLabel.text = "$ \(product.price)"
        nameLabel.text = product.title
    }
    
    
    private func configure() {
        addSubview(imageView)
        addSubview(priceLabel)
        addSubview(nameLabel)
        
        nameLabel.numberOfLines = 2
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            priceLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: padding),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}

