//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 30.08.23.
//

import UIKit

enum ProductType: String {
    case smartphones = "smartphones"
}

class ClothesVC: UIViewController {

    private var collectionView: UICollectionView!
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        fetchProduct(for: .smartphones)
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout() )
        view.addSubview(collectionView)
        collectionView.dataSource = self
        
        collectionView.register(ClotheCell.self, forCellWithReuseIdentifier: ClotheCell.reuseId)
                
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {

        return UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection? in
            switch section {
            case 0: return self.createFirstSection()
            case 1: return self.createSecondSection()
            default: return self.createFirstSection()
            }
        }
    }
    
    private func createFirstSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 60, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.50), heightDimension: .fractionalHeight(0.55))
                
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        return section
    }
    
    private func createSecondSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 60, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.50), heightDimension: .fractionalHeight(0.55))
                
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        return section
    }
    
    
    private func fetchProduct(for type: ProductType) {
        guard let url = URL(string: "https://dummyjson.com/products/category/\(type.rawValue)") else { return }
        let urlRequest = URLRequest(url: url)
        
        APIService.shared.fetch(ProductResponse.self, url: urlRequest) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.products = result.products
                    self.collectionView.reloadData()
                    // many things to come
                }
            case .failure(let error):
                print("Error: ", error)
            }
        }
    }
    
    
}


extension ClothesVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClotheCell.reuseId, for: indexPath) as! ClotheCell
        
        switch indexPath.section {
        case 0:
            let product = products[indexPath.row]
            cell.set(product: product)
        case 1:
            let product = products[indexPath.row]
            cell.set(product: product)
        default:
            break
        }
        
        return cell
    }
    
}
