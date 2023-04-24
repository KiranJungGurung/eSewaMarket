//
//  HomViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 20/04/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    let productSearch = UISearchBar()
    
    
    
    private let homeTableView: UITableView = {
        let homeTable = UITableView()
        homeTable.backgroundColor = .systemFill//.systemFill
        homeTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return homeTable
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeTableView)
        
        
        // add delegate and datasource protocol in homeTableView
        
        homeTableView.delegate = self
        homeTableView.delegate = self
        
        view.backgroundColor = .white
        let button = UIBarButtonItem(image: UIImage(systemName: "notification"), style: .plain, target: self, action: nil)
        let moreButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.vertical"), style: .plain, target: self, action: nil)
        button.tintColor = .black
        moreButton.tintColor = .black
        navigationItem.rightBarButtonItem = button
        navigationItem.leftBarButtonItem = moreButton
        navigationItem.title = "Market"
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello World"
        return cell
    }
    
    
    
}
