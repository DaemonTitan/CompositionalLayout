//
//  FeatureOfferCollectionViewCell.swift
//  CollectionCompositeLayout
//
//  Created by Tony Chen on 21/4/2023.
//

import UIKit

class FeatureOfferCollectionViewCell: UICollectionViewCell {
    static let identifier = "FeatureOfferCollectionViewCell"
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var label: UILabel = {
        var label = UILabel()
        //label.text = "Custom"
        //label.backgroundColor = .green
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 100),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -30),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            label.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -30),
            //label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -0.2),
            label.widthAnchor.constraint(equalToConstant: 160),
            label.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func configureText(text: String) {
        label.text = text
    }
    
    func configureImage(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
}
