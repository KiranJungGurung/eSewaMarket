//
//  FeaturedCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 26/04/2023.
//

import UIKit

class FeaturedCell: UICollectionViewCell {
    
    static let identifier = "FeaturedCell"
    
    private let featuredImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tshirt")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private let productTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "50 T-shirt"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private let productSubTitleLabel: UILabel = {
        let subLabel = UILabel()
        subLabel.text = "IN STOCK - 99 SHOP"
        subLabel.textColor = .gray
        subLabel.font = .systemFont(ofSize: 10, weight: .medium)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.textAlignment = .left
        return subLabel
    }()
    
    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "Rs.19,500.00"
        priceLabel.font = UIFont.systemFont(ofSize: 16)
        priceLabel.textAlignment = .left
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        return priceLabel
    }()
        //    private let wishButton: UIButton = {
        //        let wishButton = UIButton()
        //        wishButton.contentMode = .scaleAspectFit
        //        wishButton.setImage(UIImage(systemName: "heart"), for: .normal)
        //        wishButton.translatesAutoresizingMaskIntoConstraints = false
        //        wishButton.tintColor = .white
        //        wishButton.isUserInteractionEnabled = true
        //        return wishButton
        //    }()
        //need to make separate uiview and pin add button there
        
        //    private let addButton: UIButton = {
        //        let addButton = UIButton()
        //        addButton.contentMode = .scaleAspectFit
        //        addButton.setImage(UIImage(systemName: "minus"), for: .normal)
        //        addButton.translatesAutoresizingMaskIntoConstraints = false
        //        addButton.tintColor = .white
        //        addButton.isUserInteractionEnabled = true
        //        return addButton
        //    }()
        
        
        
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 40
        
        contentView.addSubview(featuredImageView)
        contentView.addSubview(productTitleLabel)
        contentView.addSubview(productSubTitleLabel)
        contentView.addSubview(priceLabel)
        //        contentView.addSubview(wishButton)
        
        NSLayoutConstraint.activate([
            featuredImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            featuredImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            featuredImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            featuredImageView.heightAnchor.constraint(equalToConstant: 120),
            
            productTitleLabel.topAnchor.constraint(equalTo: featuredImageView.bottomAnchor, constant: 10),
            productTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            productTitleLabel.bottomAnchor.constraint(equalTo: productSubTitleLabel.topAnchor, constant: 0),
            
            productSubTitleLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor),
            productSubTitleLabel.leadingAnchor.constraint(equalTo: productTitleLabel.leadingAnchor),
            productTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: productSubTitleLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: productSubTitleLabel.leadingAnchor)
            
        ])
        
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
            
        }
        
    }

