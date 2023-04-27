//
//  CategoryCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 26/04/2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"

    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "iphone.rear.camera")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 14
    return imageView
                                  
    }()
                                  
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Mobile"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
     }()

                                

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = 14
        contentView.addSubview(categoryImageView)
        contentView.addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
                  
         categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
         categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
         categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
         categoryImageView.heightAnchor.constraint(equalToConstant: 40),
      
         categoryLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 10),
         categoryLabel.heightAnchor.constraint(equalToConstant: 20),
         categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
}
