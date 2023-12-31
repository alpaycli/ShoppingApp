//
//  ClotheCell.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 30.08.23.
//

import UIKit

class ClotheCell: UICollectionViewCell {
    static let reuseId = "ClotheCell"
    
    private let imageView = ItemImageView(frame: .zero)
    private let nameLabel = SPTitleLabel(textAlignment: .left, fontSize: 14)
    private let priceLabel = SPTitleLabel(textAlignment: .right, fontSize: 14)
    private let descriptionLabel = SPBodyLabel(textAlignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(product: Product) {
        imageView.downloadImage(fromURL: product.thumbnail)
        priceLabel.text = "$\(product.price)"
        nameLabel.text = product.title
        descriptionLabel.text = product.description
    }
    
    
    private func configure() {
        addSubview(imageView)
        addSubview(priceLabel)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        
        descriptionLabel.numberOfLines = 2
        
        let padding: CGFloat = 8
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: imageView.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 35)
            
        ])
    }
}
