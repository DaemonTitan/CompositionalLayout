//
//  SectionHeader.swift
//  CollectionCompositeLayout
//
//  Created by Tony Chen on 16/4/2023.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let sectionHeaderIdentifier = "categoryHeaderId"
    
    lazy var categoryLabel: UILabel = {
        var label = UILabel()
        //label.text = "Categories"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categoryLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryLabel.frame = bounds
    }
    
    func configureText(headerText: String) {
        categoryLabel.text = headerText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


