//
//  FavoriteItemCell.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 02.09.23.
//

import UIKit

class FavoriteCell: UITableViewCell {

    static let reuseId = "FavoriteCell"
    
    private let productImageView = ItemImageView(frame: .zero)
    private let priceLabel = SPTitleLabel(textAlignment: .left, fontSize: 16)
    private let nameLabel = SPTitleLabel(textAlignment: .left, fontSize: 18)
    private let addToBagButton = SPBorderedButton()
    
    var buttonTapCallback: () -> ()  = { }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(product: Product) {
        productImageView.downloadImage(fromURL: product.thumbnail)
        priceLabel.text = "$\(product.price)"
        nameLabel.text = product.title
        nameLabel.numberOfLines = 1
        addToBagButton.set(title: "MOVE TO BAG")
        addToBagButton.addTarget(self, action: #selector(addToBagAction), for: .touchUpInside)
    }
    
    @objc private func addToBagAction() {
        buttonTapCallback()
    }
    
    private func configure() {
        addSubviews(productImageView, priceLabel, nameLabel, addToBagButton)
        accessoryType = .disclosureIndicator
        
        let rightSideComponents = [priceLabel, nameLabel]
        let padding: CGFloat = 8
        
        for component in rightSideComponents {
            NSLayoutConstraint.activate([
                component.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: padding),
                component.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            ])
        }
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            productImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            productImageView.widthAnchor.constraint(equalToConstant: 80),
            productImageView.heightAnchor.constraint(equalToConstant: 100),
            
            priceLabel.topAnchor.constraint(equalTo: productImageView.topAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 3),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            addToBagButton.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor),
            addToBagButton.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: padding),
            addToBagButton.widthAnchor.constraint(equalToConstant: 110),
            addToBagButton.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }

}
