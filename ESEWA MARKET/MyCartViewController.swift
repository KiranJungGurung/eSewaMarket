//
//  MyCartViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 23/04/2023.
//

import UIKit
import BottomSheet

class MyCartViewController: UIViewController {
    //    let pc = HomeViewController()
        var items = 2
        
        // MARK: - Add Delete and Cancel View
        
      
        // MARK: - Add Custom FooterView
        
        private var footerView: UIView = {
            let myfooterView = UIView()
            myfooterView.translatesAutoresizingMaskIntoConstraints = false
            myfooterView.backgroundColor = .white//.systemFill
            return myfooterView
        }()
        
        private let myCheckOutTotal: UILabel = {
            let total = UILabel()
            total.text = "Checkout Total"
            total.translatesAutoresizingMaskIntoConstraints = false
            total.textAlignment = .left
            total.font = .systemFont(ofSize: 16, weight: .bold)
            total.textColor = .gray
            return total
        }()
        
        private let totalPriceLabel: UILabel = {
            let totalPrice = UILabel()
            totalPrice.text = "Rs.52,500"
            totalPrice.translatesAutoresizingMaskIntoConstraints = false
            totalPrice.textAlignment = .left
            totalPrice.font = .systemFont(ofSize: 16, weight: .medium)
            totalPrice.textColor = .black
            return totalPrice
        }()
        
        private let myCheckOutButton: UIButton = {
            let checkOutButton = UIButton()
            checkOutButton.translatesAutoresizingMaskIntoConstraints = false
            checkOutButton.setTitle("CHECKOUT", for: .normal)
            checkOutButton.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
            checkOutButton.layer.cornerRadius = 16
            checkOutButton.layer.masksToBounds = true
            return checkOutButton
        }()
        
    //    func getProductList(resposne: ProductResponse) {
    //
    //    }
        
    // MARK: - Add a table View
        
        private let tableView: UITableView = {
            let table = UITableView()
            //table.backgroundColor = .clear//.systemFill
            table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
            return table
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            // VC ko view ko color
            self.view.backgroundColor = .systemGray6.withAlphaComponent(1)
            
            //MARK: - ADD NABBAR INTO VIEWCONTROLLER
            
                let button = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: nil)
                let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: nil)
                button.tintColor = .black
                backButton.tintColor = .black
                navigationItem.rightBarButtonItem = button
                navigationItem.leftBarButtonItem = backButton
                navigationItem.title = "My Cart"
           
            // add tableview to view
            view.addSubview(tableView)
            view.addSubview(footerView)
            view.addSubview(myCheckOutTotal)
            view.addSubview(totalPriceLabel)
            view.addSubview(myCheckOutButton)

            // add the data source and delegate into tableview
            setupTableView()
        }
        
        // changing the layout
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tableView.frame = view.bounds
            setupFooterView()
        }
        
        private func setupTableView() {
            tableView.delegate = self
            tableView .dataSource = self
            tableView.backgroundColor = .clear
            tableView.separatorStyle = .none
        }
        
        private func setupFooterView() {
            
            NSLayoutConstraint.activate([
                
                
                // MARK: - Set Constraint of footerView
                
                footerView.leadingAnchor.constraint(equalTo: self.tableView.leadingAnchor, constant: 0),
                footerView.bottomAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 0),
                footerView.trailingAnchor.constraint(equalTo: self.tableView.trailingAnchor, constant: 0),
                footerView.heightAnchor.constraint(equalToConstant: 100),
                
                // pin checkouttotal label
                
                myCheckOutTotal.topAnchor.constraint(equalTo: self.footerView.topAnchor, constant: 8),
                myCheckOutTotal.leadingAnchor.constraint(equalTo: self.footerView.leadingAnchor, constant:8),
                myCheckOutTotal.trailingAnchor.constraint(equalTo: self.footerView.trailingAnchor, constant: -8),
                
                // totalPriveLabel
                totalPriceLabel.topAnchor.constraint(equalTo: myCheckOutTotal.bottomAnchor),
                totalPriceLabel.leadingAnchor.constraint(equalTo: myCheckOutTotal.leadingAnchor),
                totalPriceLabel.heightAnchor.constraint(equalToConstant: 30),
                
                // pin Checkout button
                myCheckOutButton.topAnchor.constraint(equalTo: self.footerView.topAnchor, constant: 16),
                myCheckOutTotal.trailingAnchor.constraint(equalTo: self.footerView.trailingAnchor, constant: 16),
                myCheckOutButton.trailingAnchor.constraint(equalTo: self.footerView.trailingAnchor, constant: -16),
                myCheckOutButton.widthAnchor.constraint(equalToConstant: 170),
                myCheckOutButton.heightAnchor.constraint(equalToConstant: 40)
                
            ])
        }

    }
        
    extension MyCartViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("clicked cell at \(indexPath.row)")
            
        }
        // add delete row feature with swap action
        
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                
                
    //            let alertController = UIAlertController(title: "Delete from cart", message: "Are you sure you want to delete this item(s)?", preferredStyle: .alert)
    //
    //            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
    //                tableView.reloadData()
    //            }
    //
    //            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
    //                tableView.deleteRows(at: [indexPath], with: .fade)
    //            }
    //
    //            alertController.addAction(cancelAction)
    //            alertController.addAction(deleteAction)
    //
    //            present(alertController, animated: true, completion: nil)
                
//                // show the delete pop up view
                let vc = DeletePopUpViewController()
                vc.modalPresentationStyle = .popover
//                vc.contentSizeForViewInPopover.height = 300
                vc.preferredContentSize.height = 50
                // Keep animated value as false
                // Custom Modal presentation animation will be handled in VC itself
                self.present(vc, animated: true)
                
            }
        }
        
    }

    extension MyCartViewController: UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "items \(items)"
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
    //        cell.textLabel?.text = "Cell \(indexPath.row )"
//            cell.on = {
//                 update the amount view in footerview label
//            }
            cell.backgroundColor = .clear
                return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return 150
            
        }
        
        //* reference for shop page
        
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //        let footerView = UIView()
    //        footerView.backgroundColor = .cyan
    //        return footerView
    //    }
    //
    //    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    //        return 120
    //    }
        
    }
