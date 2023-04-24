//
//  ProductDetailViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 21/04/2023.
//

import UIKit

class ProductDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let  tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.identifier)
        return table

    }()
    
    private var sections = [SectionType]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSections()
        
       
        
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
       
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureSections() {
        
        sections.append(.productPhotos(images: [
            UIImage(named: "1"),
            UIImage(named: "2"),
            UIImage(named: "3"),

        ].compactMap({ $0 })))
        
        sections.append(.productInfo(viewModels: [TextCellViewModel(
            text: "Jacket In Nylon", font: .systemFont(ofSize: 18)),

            TextCellViewModel(text: "Price: $49.99", font: .systemFont(ofSize: 22))
            
             ]))
        
        sections.append(.relatedProducts)
    }
    // Table
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionType = sections[section]
        return sectionType.title
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sections[indexPath.section]
        
        switch sectionType {
            
        case.productPhotos(let images):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier, for: indexPath) as? PhotoTableViewCell else {
                fatalError()
            }
            cell.configure(with: images)
            return cell
            
        case.productInfo(let viewModels):
            let viewModel = viewModels[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
            cell.configure(with: viewModel)
            return cell
        
        case.relatedProducts:
            break
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello World!"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .productPhotos:
            return view.frame.size.width
        case.relatedProducts:
            return UITableView.automaticDimension
        case.productInfo:
            return UITableView.automaticDimension
            
        }
    }

}

extension UITableViewCell {
    func configure(with viewModel: TextCellViewModel) {
        textLabel?.text = viewModel.text
        textLabel?.numberOfLines = 0
        textLabel?.font = viewModel.font
    }
    
}
