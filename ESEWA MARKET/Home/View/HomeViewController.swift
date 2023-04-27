
//  HomViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 20/04/2023.


import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {
    // class HomeViewController: import UIKit

    var searchController = UISearchController(searchResultsController: nil)
//    var presenter: HomePresenter?
//    var bannerList: [BannerModel]?
//
    

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

//        // presenter init
//        presenter = HomePresenter(delegate: self)
//        presenter?.fetch()

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
        homeTableView.dataSource = self
        homeTableView.backgroundColor = .clear
        homeTableView.separatorStyle = .none

        homeTableView.register(ShopBannerTableViewCell.self, forCellReuseIdentifier: ShopBannerTableViewCell.reuseIdentifier)
        homeTableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: CategoriesTableViewCell.reuseIdentifier)
        homeTableView.register(FeaturedTableViewCell.self, forCellReuseIdentifier: FeaturedTableViewCell.reuseIdentifier)
    }
    private func searchBar() {
        navigationItem.searchController = UISearchController()
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "What are you searching for?"
        searchController.searchBar.tintColor = .white
    }

//    func didGetData(with data: [BannerModel]) {
//
//
//    }
//    func didGetData(with data: [BannerModel]?) {
//        // after the presenter calls it (api ko succes)
//        print("did get data: \(data)")
//        self.bannerList = data
//        homeTableView.reloadData()
//    }
//
//    func didGetDataWithError(message: String?) {
//        // display alert error message
//    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        case 1:
            return "Categories"
        case 2:
            return "Featured Products"
//        case 3:
//            return "Hot Deals Of TheDay"
//        case 4:
//            return "Popular Brands"
//        case 5:
//            return "Recommended for you"
//
        default:
            return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: ShopBannerTableViewCell.reuseIdentifier, for: indexPath) as! ShopBannerTableViewCell
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
        
        case 1:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.reuseIdentifier, for: indexPath) as! CategoriesTableViewCell
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        default:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: FeaturedTableViewCell.reuseIdentifier, for: indexPath) as! FeaturedTableViewCell
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
  
        }
           

    }
       
}
        
        
    

