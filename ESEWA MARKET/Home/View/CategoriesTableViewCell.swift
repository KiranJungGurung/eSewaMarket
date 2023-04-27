//
//  CategoriesTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 26/04/2023.
//


import UIKit

class CategoriesTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "CategoriesTableViewCell"
    
    private let categoriesCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .white
            return collectionView
        
        }()
        
        
    static let reuseIdentifier = "CategoriesTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.addSubview(categoriesCollectionView)
        

        
        // add datasource and delegate protocol
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
               categoriesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
               categoriesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               categoriesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
               categoriesCollectionView.heightAnchor.constraint(equalToConstant: 70),
               
               
           ])
        
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)

    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
}
extension CategoriesTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        return cell
    }
    
}


extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 90)
     }
    
}







