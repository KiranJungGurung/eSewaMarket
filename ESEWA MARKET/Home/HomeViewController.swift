//
//  HomViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 20/04/2023.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {
    
    var searchController = UISearchController(searchResultsController: nil)
    
    private let homeTableView: UITableView = {
        let homeTable = UITableView()
        homeTable.backgroundColor = .white//.systemFill
        homeTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return homeTable
    }()
    
    
//    private let homeCollectionView: UICollectionView = {
//        let collectionView = UIColllectionView
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeTableView)
        setupTableView()
        searchBar()
        
        
        view.backgroundColor = .white
        let button = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: nil)
        button.tintColor = .black
        navigationItem.rightBarButtonItem = button
    
        navigationItem.title = "Market"
        
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTableView.frame = view.bounds
    }
    
    private func setupTableView() {
        homeTableView.delegate = self
        homeTableView .dataSource = self
        homeTableView.backgroundColor = .clear
        homeTableView.separatorStyle = .none
    }
    private func searchBar() {
        navigationItem.searchController = UISearchController()
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.tintColor = .white
    }
    
    

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
    
}

