//
//  ViewController.swift
//  CollectionCompositeLayout
//
//  Created by Tony Chen on 14/4/2023.
//

import UIKit

class ViewController: UIViewController {
    
//    static let categoryHeaderId = "categoryHeaderId"
//    static let hotOfferHeaderId = "hotOfferHeaderID"

    lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: ViewController.createLayout())
        collectionView.register(SectionHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionHeader.sectionHeaderIdentifier)
        
        collectionView.register(CategoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        collectionView.register(PromotionCollectionViewCell.self,
                                forCellWithReuseIdentifier: PromotionCollectionViewCell.identifier)
        
        collectionView.register(FeatureOfferCollectionViewCell.self,
                                forCellWithReuseIdentifier: FeatureOfferCollectionViewCell.identifier)
        
        collectionView.register(HotOfferCollectionViewCell.self,
                                forCellWithReuseIdentifier: HotOfferCollectionViewCell.identifier)
        
        collectionView.backgroundColor = .systemGray5
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return section == 0 ? 3 : 8
        switch section {
        case 0:
            return 3
        case 1:
            return 8
        case 2:
            return 3
        case 3:
            return 6
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let promoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionCollectionViewCell.identifier, for: indexPath) as! PromotionCollectionViewCell
        let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        let featureCell = collectionView.dequeueReusableCell(withReuseIdentifier: FeatureOfferCollectionViewCell.identifier, for: indexPath) as! FeatureOfferCollectionViewCell
        let hotOfferCell = collectionView.dequeueReusableCell(withReuseIdentifier: HotOfferCollectionViewCell.identifier, for: indexPath) as! HotOfferCollectionViewCell
        
        let sectionNumber = [indexPath.section]
        
        switch sectionNumber[0] {
        /// Promotion Collection View Cell
        case 0:
            promoCell.imageView.image = UIImage(systemName: "house")
            promoCell.backgroundColor = .red
            promoCell.layer.cornerRadius = 8
            return promoCell
        /// Category Collection View Cell
        case 1:
            categoryCell.backgroundColor = .white
            categoryCell.layer.cornerRadius = 8
            let categoryImage = categoryDetails.categoryItem[indexPath.item].image
            let categoryTitle = categoryDetails.categoryItem[indexPath.item].title
            categoryCell.configureImage(imageName: categoryImage)
            categoryCell.configureText(text: categoryTitle)
            return categoryCell
        /// Feature Offer Collection View Cell
        case 2:
            featureCell.backgroundColor = .systemBrown
            featureCell.layer.cornerRadius = 8
            let featureOfferImage = promationOfferDetails.featureOfferItem[indexPath.item].image
            let featureOfferDescription = promationOfferDetails.featureOfferItem[indexPath.item].description
            featureCell.configureImage(imageName: featureOfferImage)
            featureCell.configureText(text: featureOfferDescription)
            return featureCell
        /// Hot Offer Collection View Cell
        case 3:
            let hotOfferImage = hotOfferDetails.hotOfferItem[indexPath.item].image
            let hotOfferTitle = hotOfferDetails.hotOfferItem[indexPath.item].title
            let hotOfferCarlories = hotOfferDetails.hotOfferItem[indexPath.item].calories
            let hotOfferCarbon = hotOfferDetails.hotOfferItem[indexPath.item].carbon
            let hotOfferFat = hotOfferDetails.hotOfferItem[indexPath.item].fat
            let hotOfferPrice = hotOfferDetails.hotOfferItem[indexPath.item].price
            
            print(hotOfferPrice)
            hotOfferCell.backgroundColor = .white
            hotOfferCell.layer.cornerRadius = 8
            hotOfferCell.configureImage(imageName: hotOfferImage)
            hotOfferCell.configureText(text: hotOfferTitle)
            
            hotOfferCell.configureSFText(label: hotOfferCell.caloriesLabel,
                                         text: hotOfferCarlories,
                                         symbols: "flame.fill",
                                         size: 20,
                                         symboleColour: .systemRed,
                                         lineBreak: true)
            hotOfferCell.configureSFText(label: hotOfferCell.carbonLabel,
                                         text: hotOfferCarbon,
                                         symbols: "leaf.fill",
                                         size: 20,
                                         symboleColour: .systemGreen,
                                         lineBreak: true)
            hotOfferCell.configureSFText(label: hotOfferCell.fatLabel,
                                         text: hotOfferFat,
                                         symbols: "drop.degreesign.fill",
                                         size: 20,
                                         symboleColour: .systemYellow,
                                         lineBreak: true)
            hotOfferCell.configureSFText(label: hotOfferCell.priceLabel,
                                         text: hotOfferPrice,
                                         symbols: "dollarsign",
                                         size: 10,
                                         symboleColour: .systemRed,
                                         lineBreak: false)
            return hotOfferCell
        default:
            return UICollectionViewCell()
        }
    }
    
    // MARK: Section header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let section = indexPath.section

        if kind == UICollectionView.elementKindSectionHeader {
            switch section {
            case 1:
                let categoryHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: SectionHeader.sectionHeaderIdentifier,
                                                                             for: indexPath) as! SectionHeader
                ///categoryHeader.backgroundColor = .green
                categoryHeader.configureText(headerText: "Category")
                
                return categoryHeader
            case 2:
                let featureOfferHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                withReuseIdentifier: SectionHeader.sectionHeaderIdentifier,
                                                                                for: indexPath) as! SectionHeader
                //featureOfferHeader.backgroundColor = .green
                featureOfferHeader.configureText(headerText: "Feature Offer")
                return featureOfferHeader
            case 3:
                let hotOfferHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                withReuseIdentifier: SectionHeader.sectionHeaderIdentifier,
                                                                                for: indexPath) as! SectionHeader
                //hotOfferHeader.backgroundColor = .green
                hotOfferHeader.configureText(headerText: "Hot Offer")
                return hotOfferHeader
            default:
                return UICollectionReusableView()
            }

        }
        return UICollectionReusableView()
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let controller = UIViewController()
//        controller.view.backgroundColor = indexPath.section == 0 ? .yellow : .blue
//        navigationController?.pushViewController(controller, animated: true)
//    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
                // Item
                let item = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2, bottom: 1, trailing: 2)
                
                // Group
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(150)),
                    repeatingSubitem: item,
                    count: 1)
                
                // Sections
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                return section
            } else if sectionNumber == 1 {
                
                // Item
                let item = NSCollectionLayoutItem(layoutSize: .init(
                    widthDimension: .fractionalWidth(0.25),
                    heightDimension: .absolute(150)))
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2, bottom: 16, trailing: 16)
                
                // Group
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(500)),
                    subitems: [item])
                
                // Sections
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                group.contentInsets.trailing = 16
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(50)),
                          elementKind: UICollectionView.elementKindSectionHeader,
                          alignment: .topLeading)
                ]
                return section
            } else if sectionNumber == 2 {
                // Item
                let item = NSCollectionLayoutItem.init(layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(0.8))
                )
                item.contentInsets.trailing = 32
                
                // Group
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(0.8),
                        heightDimension: .absolute(100)),
                    subitems: [item])
                
                // Sections
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(50)),
                          elementKind: UICollectionView.elementKindSectionHeader,
                          alignment: .topLeading)
                ]
                
                return section
            } else {
                let item = NSCollectionLayoutItem.init(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(0.5),
                        heightDimension: .absolute(300)))
                item.contentInsets.bottom = 16
                item.contentInsets.trailing = 16


                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(1000)),
                    subitems: [item])


                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(50)),
                          elementKind: UICollectionView.elementKindSectionHeader,
                          alignment: .topLeading,
                          absoluteOffset: CGPoint(x: 0, y: 0)
                    )
                ]
                
                return section
            }
        }
    }
}
