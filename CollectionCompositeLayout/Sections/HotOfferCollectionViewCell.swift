//
//  HotOfferCollectionViewCell.swift
//  CollectionCompositeLayout
//
//  Created by Tony Chen on 23/4/2023.
//

import UIKit

class HotOfferCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HotOfferCollectionViewCell"
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var label: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var caloriesLabel: UILabel = {
        var caloriesLabel = UILabel()
        caloriesLabel.textAlignment = .center
        caloriesLabel.lineBreakMode = .byWordWrapping
        caloriesLabel.numberOfLines = 2
        caloriesLabel.font = .systemFont(ofSize: 15)
        caloriesLabel.translatesAutoresizingMaskIntoConstraints = false
        return caloriesLabel
    }()
    
    lazy var carbonLabel: UILabel = {
        var carbonLabel = UILabel()
        carbonLabel.textAlignment = .center
        carbonLabel.lineBreakMode = .byWordWrapping
        carbonLabel.numberOfLines = 2
        carbonLabel.font = .systemFont(ofSize: 16)
        carbonLabel.translatesAutoresizingMaskIntoConstraints = false
        return carbonLabel
    }()
    
    lazy var fatLabel: UILabel = {
        var fatLabel = UILabel()
        fatLabel.textAlignment = .center
        fatLabel.lineBreakMode = .byWordWrapping
        fatLabel.numberOfLines = 2
        fatLabel.font = .systemFont(ofSize: 15)
        fatLabel.translatesAutoresizingMaskIntoConstraints = false
        return fatLabel
    }()
    
    lazy var priceLabel: UILabel = {
        var priceLabel = UILabel()
        priceLabel.textAlignment = .left
        priceLabel.font = .systemFont(ofSize: 20, weight: .bold)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        contentView.addSubview(caloriesLabel)
        contentView.addSubview(carbonLabel)
        contentView.addSubview(fatLabel)
        contentView.addSubview(priceLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -70),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 110),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -0.2),
            label.widthAnchor.constraint(equalToConstant: 90),
            label.heightAnchor.constraint(equalToConstant: 45),
            
            caloriesLabel.topAnchor.constraint(equalTo: label.bottomAnchor),
            caloriesLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -50),
            caloriesLabel.widthAnchor.constraint(equalToConstant: 100),
            caloriesLabel.heightAnchor.constraint(equalToConstant: 50),
            
            carbonLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 1),
            carbonLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            carbonLabel.widthAnchor.constraint(equalToConstant: 100),
            carbonLabel.heightAnchor.constraint(equalToConstant: 50),
            
            fatLabel.topAnchor.constraint(equalTo: label.bottomAnchor),
            fatLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 50),
            fatLabel.widthAnchor.constraint(equalToConstant: 100),
            fatLabel.heightAnchor.constraint(equalToConstant: 50),
            
            priceLabel.topAnchor.constraint(equalTo: carbonLabel.bottomAnchor),
            priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 10),
            priceLabel.widthAnchor.constraint(equalToConstant: 100),
            priceLabel.heightAnchor.constraint(equalToConstant: 45)
            
        ])
    }
    
    func configureText(text: String) {
        label.text = text
    }
    
    func configureSFText(label: UILabel, text: String, symbols: String, size: CGFloat, symboleColour: UIColor, lineBreak: Bool) {
        // 1. create the image for the attributed string
        let attachment = NSTextAttachment()
        let SizeConfig = UIImage.SymbolConfiguration(pointSize: size)
        attachment.image = UIImage(systemName: symbols, withConfiguration: SizeConfig)?.withTintColor(symboleColour)
        
        // 2. Create the attributed string and append the image
        let imageString = NSMutableAttributedString(attachment: attachment)
        
        if lineBreak == true {
            let textString = NSAttributedString(string: "\n" + text)
            imageString.append(textString)
        } else {
            let textString = NSAttributedString(string: " " + text)
            imageString.append(textString)
        }
        
        // 3. Attach to attribute text
        label.attributedText = imageString
    }
    
    func configureImage(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
}
