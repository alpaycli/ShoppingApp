//
//  ProductDetailVC.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 31.08.23.
//

import UIKit

class ProductDetailVC: UIViewController {
    
    private let imageView = ItemImageView(frame: .zero)
    private let saveButton = UIButton()
    private let priceLabel = SPTitleLabel(textAlignment: .left, fontSize: 20)
    private let titleLabel = SPTitleLabel(textAlignment: .left, fontSize: 24)
    private let descriptionLabel = SPBodyLabel(textAlignment: .left)
    private let ratingLabel = SPTitleLabel(textAlignment: .left, fontSize: 20)
    private let addToBagButton = SPButton(backgroundColor: .systemGreen, title: "ADD TO BAG")
    
    private var product: Product!
    
    init(product: Product) {
        super.init(nibName: nil, bundle: nil)
        self.product = product
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(imageView, saveButton, priceLabel, titleLabel, descriptionLabel, ratingLabel, addToBagButton)
        configureElementsContent()
        configureSaveButton()
        configureUI()
    }
    
    private func configureElementsContent() {
        imageView.downloadImage(fromURL: product.images[0])
        priceLabel.text = "$ \(product.price)"
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        descriptionLabel.numberOfLines = 2
        ratingLabel.text = "⭐️ \(product.rating)"
    }
        
    private func configureUI() {
        
        let smallComponents = [priceLabel, titleLabel, descriptionLabel, ratingLabel, addToBagButton]
        
        for item in smallComponents {
            item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            item.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 240),
            
            saveButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 60),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            
            priceLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10),
            priceLabel.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 40),
            
            ratingLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            ratingLabel.heightAnchor.constraint(equalToConstant: 30),
            
            addToBagButton.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 30),
            addToBagButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func configureSaveButton() {
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        saveButton.titleLabel?.text = "Save"
        saveButton.setImage(UIImage(systemName: "heart"), for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
    
    @objc func saveButtonAction() {
        PersistenceManager.shared.updateWith(product, actionType: .add) { error in
            guard error == nil else {
                return
            }
            print("Everyting is ok. ----------------------------------------------------")
        }
    }
}
