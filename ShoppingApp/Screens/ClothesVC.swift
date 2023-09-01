//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Alpay Calalli on 30.08.23.
//

import UIKit

enum ProductType: String {
    case smartphones = "smartphones"
    case laptops = "laptops"
    case fragrances
    case skincare
    case groceries
    case homeDecoration = "home-decoration"
    case furniture
    case tops
    case womensDresses = "womens-dresses"
    case womensShoes = "womens-shoes"
    case womensWatches = "womens-watches"
    case womensBags = "womens-bags"
    case womensJewellery = "womens-jewellery"
    case mensShirts = "mens-shirts"
    case menShoes = "mens-shoes"
    case mensWatches = "mens-watches"
    case sunglasses
    case automotive
    case motorcycle
}

final class ClothesVC: UIViewController {
    
    private let firstSectionHeaderId = "firstSectionHeaderId"
    private let firstHeaderId = "firstHeaderId"
    private let secondSectionHeaderId = "secondSectionHeaderId"
    private let secondHeaderId = "secondHeaderId"
    private let thirdSectionHeaderId = "thirdSectionHeaderId"
    private let thirdHeaderId = "thirdHeaderId"

    private var collectionView: UICollectionView!
    
    private var sections: [ProductType] = [.smartphones, .laptops, .womensDresses, .tops, .skincare]
    
    private var smartphones: [Product] = []
    private var laptops: [Product] = []
    private var womensDresses: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        fetchProduct(for: .smartphones)
        fetchProduct(for: .laptops)
        fetchProduct(for: .womensDresses)
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout() )
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(HeaderItemCell.self, forCellWithReuseIdentifier: HeaderItemCell.reuseId)
        collectionView.register(ClotheCell.self, forCellWithReuseIdentifier: ClotheCell.reuseId)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseId)
        
        collectionView.register(FirstSectionHeaderView.self, forSupplementaryViewOfKind: firstSectionHeaderId, withReuseIdentifier: firstHeaderId)
        collectionView.register(SecondSectionHeaderView.self, forSupplementaryViewOfKind: secondSectionHeaderId, withReuseIdentifier: secondHeaderId)
        collectionView.register(ThirdSectionHeaderView.self, forSupplementaryViewOfKind: thirdSectionHeaderId, withReuseIdentifier: thirdHeaderId)
                
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
            case 0: return self.createHeaderSection()
            case 1: return self.createFirstSection()
            case 2: return self.createSecondSection()
            case 3: return self.createThirdSection()
            default: return self.createHeaderSection()
            }
        }
    }
    
    func createHeaderSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.2))
                
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func createFirstSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.50), heightDimension: .fractionalHeight(0.44))
                
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: firstSectionHeaderId, alignment: .topLeading)
        ]
        section.contentInsets.leading = 15
        
        return section
    }
    
    private func createSecondSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.50), heightDimension: .fractionalHeight(0.44))
                
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: secondSectionHeaderId, alignment: .top)
        ]
        section.contentInsets.leading = 15
        
        return section
    }
    
    private func createThirdSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 25, leading: 0, bottom: 25, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.50), heightDimension: .fractionalHeight(0.44))
                
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: thirdSectionHeaderId, alignment: .top)
        ]
        section.contentInsets.leading = 15
        
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
                    switch type {
                    case .smartphones:
                        self.smartphones = result.products
                    case .laptops:
                        self.laptops = result.products
                    case .womensDresses:
                        self.womensDresses = result.products
                    default:
                        return
                    }
                    self.collectionView.reloadData()
                    
                }
            case .failure(let error):
                print("Error: ", error)
            }
        }
    }
    
}

extension ClothesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var product: Product?
        
        switch indexPath.section {
        case 0:
            let selectedItem = IndexPath(item: 0, section: indexPath.row +  1)
            collectionView.scrollToItem(at: selectedItem, at: .centeredVertically, animated: true)
        case 1:
            product = smartphones[indexPath.row]
        case 2:
            product = laptops[indexPath.row]
        case 3:
            product = womensDresses[indexPath.row]
        default:
            break
        }
        
        if let product = product {
            let destinationVC = ProductDetailVC(product: product)
            navigationController?.pushViewController(destinationVC, animated: true)
        }
        
    }
}


extension ClothesVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return sections.count
        case 1:
            return smartphones.count
        case 2:
            return laptops.count
        case 3:
            return womensDresses.count - 2
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let headerItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderItemCell.reuseId, for: indexPath) as! HeaderItemCell
        
        let clotheCell = collectionView.dequeueReusableCell(withReuseIdentifier: ClotheCell.reuseId, for: indexPath) as! ClotheCell
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
                
        switch indexPath.section {
        case 0:
            let item = sections[indexPath.row]
            headerItemCell.set(type: item)
            return headerItemCell
        case 1:
            let product = smartphones[indexPath.row]
            clotheCell.set(product: product)
            return clotheCell
        case 2:
            let product = laptops[indexPath.row]
            clotheCell.set(product: product)
            return clotheCell
        case 3:
            let product = womensDresses[0...2][indexPath.row]
            productCell.set(product: product)
            return productCell
        default:
            return clotheCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header: UICollectionReusableView
        switch indexPath.section {
        case 1:
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: firstHeaderId, for: indexPath)
        case 2:
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: secondHeaderId, for: indexPath)
        case 3:
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: thirdHeaderId, for: indexPath)
        default:
            header = UICollectionReusableView()
        }
        
        return header
    }
}
