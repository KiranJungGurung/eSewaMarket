//
//  ShopBannerTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 25/04/2023.
//

import UIKit

class ShopBannerTableViewCell: UITableViewCell, UICollectionViewDelegate {
 
    private let cellReuseIdentifier = "ShopBannerTableViewCell"
//    private var list: [BannerModel]?
    
    let pageControl = UIPageControl()
   
    // Add collectionView
    private let homeCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        collectionView.collectionViewLayout = layout
        return collectionView
        
       
        
    }()
    
    
    
    static let reuseIdentifier = "ShopBannerTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.addSubview(homeCollectionView)
        
        
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .red
        contentView.addSubview(pageControl)

        
        // add datasource and delegate protocol
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
               homeCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
               homeCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               homeCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
               homeCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
               homeCollectionView.heightAnchor.constraint(equalToConstant: 200),
               
               
               // pin pagecontrol to homeCollectionView
               pageControl.topAnchor.constraint(equalTo: homeCollectionView.bottomAnchor),
               pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
               
           ])
        
        homeCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)

    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//                let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
//                pageControl.currentPage = Int(pageIndex)
//                let visibleCells = homeCollectionView.visibleCells
//                           guard let firstVisibleCell = visibleCells.first else { return }
//                           let visibleIndex = homeCollectionView.indexPath(for: firstVisibleCell)?.item ?? 0
//                           pageControl.currentPage = visibleIndex
//
//            }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //func setuop params list(images)
//    func setupBannerList(with list: [BannerModel]) {
//        self.list = list
//        homeCollectionView.reloadData()
//    }
//
    
    
}
extension ShopBannerTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        cell.setupCollectionCell(with: "banner\(indexPath.row + 1)")
        return cell
    }
    
}


extension ShopBannerTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 170)
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}




