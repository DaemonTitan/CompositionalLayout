//
//  PromotionCollectionViewCell.swift
//  CollectionCompositeLayout
//
//  Created by Tony Chen on 21/4/2023.
//

import UIKit

class PromotionCollectionViewCell: UICollectionViewCell {
    static let identifier = "promotionCollectionViewCell"
    
    let gradientLayer = CAGradientLayer()
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var label: UILabel = {
        var label = UILabel()
        label.text = "Custom"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2
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
        
        
        //backgroundGradientColour()

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -16),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -0.2),
            label.widthAnchor.constraint(equalToConstant: 80),
            label.heightAnchor.constraint(equalToConstant: 45)
        ])
        
    }
    
    func configureText(text: String) {
        label.text = text
    }
    
    func configureImage(imageName: String) {
        imageView.image = UIImage(named: imageName)
        
    }
    
    func backgroundGradientColour() {
        let topColor = UIColor(red: 95.0/255.0, green: 165.0/255.0, blue: 1.0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 72.0/255.0, green: 114.0/255.0, blue: 184.0/255.0, alpha: 1.0).cgColor
        gradientLayer.frame = contentView.bounds
        gradientLayer.colors = [topColor, bottomColor]
        layer.addSublayer(gradientLayer)
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    
}
