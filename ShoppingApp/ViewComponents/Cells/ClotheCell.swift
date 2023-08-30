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
    private let priceLabel = SPTitleLabel(textAlignment: .left, fontSize: 16)
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
        
        
        let padding: CGFloat = 8
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 10),
            
            nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
