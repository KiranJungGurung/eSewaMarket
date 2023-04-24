//
//  CustomCartableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 18/04/2023.
//
import UIKit

class CustomTableViewCell: UITableViewCell {


  static let identifier = "CustomCartableViewCell"

    var countChanged: ((Double)-> Void)?


// MARK: - Add ContainerView
    
    private let containerView: UIView = {
        let myContainerView = UIView()
        myContainerView.translatesAutoresizingMaskIntoConstraints = false
        myContainerView.layer.cornerRadius = 16
        myContainerView.layer.shadowColor = UIColor.black.cgColor
        myContainerView.layer.shadowRadius = 10
        myContainerView.layer.shadowOpacity = 0.4
        myContainerView.layer.shadowOffset = .zero
        myContainerView.backgroundColor = .white
        return myContainerView
        
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jacket")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView

    }()

    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "Jacket on Nylon"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()

    private let mySubLabel: UILabel = {
        let subLabel = UILabel()
        subLabel.text = "Celeine"
        subLabel.textColor = .gray
        subLabel.font = .systemFont(ofSize: 10, weight: .medium)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.textAlignment = .left
        return subLabel
    }()
    
    private let ProductQuantity: UILabel = {
        let quantityLabel = UILabel()
        quantityLabel.text = "Rs.19,500.00"
        quantityLabel.font = UIFont.systemFont(ofSize: 16)
        quantityLabel.textAlignment = .left
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        return quantityLabel

    }()
    
    
// MARK: - Add CountView
    
    private let myCountView: UIView = {
        let countView = UIView()
        countView.translatesAutoresizingMaskIntoConstraints = false
        countView.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        countView.layer.cornerRadius = 16
        countView.layer.maskedCorners = [.layerMaxXMaxYCorner,
                                         .layerMinXMinYCorner, .layerMaxXMinYCorner]
        return countView
        
    }()
    
    private let mySubButton: UIButton = {
        let subButton = UIButton()
        subButton.contentMode = .scaleAspectFit
        subButton.setImage(UIImage(systemName: "minus"), for: .normal)
        subButton.translatesAutoresizingMaskIntoConstraints = false
        subButton.tintColor = .white
        subButton.isUserInteractionEnabled = true
        return subButton
    }()
    
    private let itemCountLabel: UILabel = {
        let count = UILabel()
        count.text = "01"
        count.font = UIFont.systemFont(ofSize: 14)
        count.textAlignment = .center
        count.translatesAutoresizingMaskIntoConstraints = false
        count.textColor = .white
        return count
    }()

    private let myAddButton: UIButton = {
        let addButton = UIButton()
        addButton.contentMode = .scaleAspectFit
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.tintColor = .white
        addButton.isUserInteractionEnabled = true
        return addButton

    }()
    
    var quantity = 1
    var productPrice =  19_500.00
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear//.systemBackground
        
        contentView.addSubview(containerView)
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        contentView.addSubview(mySubLabel)
        contentView.addSubview(ProductQuantity)
        
        
        contentView.addSubview(myCountView)
        contentView.addSubview(mySubButton)
        contentView.addSubview(itemCountLabel)
        contentView.addSubview(myAddButton)
        
        myAddButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        mySubButton.addTarget(self, action: #selector(subButtonTapped(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    private func setupViews() {
        
   // MARK: - Set Constraints to ContainerView
        // pin the container view
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),

            // pin image view inside containerview
            myImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 8),
            myImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 16),
            myImageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -8),
            myImageView.widthAnchor.constraint(equalToConstant: 100),
            myImageView.heightAnchor.constraint(equalToConstant: 100),
             
           // pin title label
            
            myLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 8),
            myLabel.heightAnchor.constraint(equalToConstant: 80),
            
            // pin subtitle label
            mySubLabel.leadingAnchor.constraint(equalTo: myLabel.leadingAnchor),
            mySubLabel.heightAnchor.constraint(equalToConstant: 120),
            
            // pin price label
            ProductQuantity.leadingAnchor.constraint(equalTo: mySubLabel.leadingAnchor),
            ProductQuantity.heightAnchor.constraint(equalToConstant: 230),
            
            
            // MARK: - Add Constraints to CounterView
            
            // pin CounterView:
            
            myCountView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 0),
            myCountView.leadingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -38),
            myCountView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0),
            myCountView.widthAnchor.constraint(equalToConstant: 38),
            
            // pin mySubButton in myCountView
            
            mySubButton.topAnchor.constraint(equalTo: myCountView.topAnchor, constant: 10),
            mySubButton.leadingAnchor.constraint(equalTo: myCountView.leadingAnchor, constant: 10),
            mySubButton.trailingAnchor.constraint(equalTo: myCountView.trailingAnchor, constant: -10),
            mySubButton.heightAnchor.constraint(equalToConstant: 20),
            
            // pin counter in myCountView
            itemCountLabel.leadingAnchor.constraint(equalTo: myCountView.leadingAnchor, constant: 10),
            itemCountLabel.trailingAnchor.constraint(equalTo: myCountView.trailingAnchor, constant: -10),
            itemCountLabel.heightAnchor.constraint(equalToConstant: 155),
            
            //pin addbutton
            myAddButton.leadingAnchor.constraint(equalTo: mySubButton.trailingAnchor, constant: -14),
            myAddButton.trailingAnchor.constraint(equalTo: mySubButton.leadingAnchor, constant:  14),
            myAddButton.bottomAnchor.constraint(equalTo: myCountView.bottomAnchor, constant: -8),
            myAddButton.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func calculatePrice(quantity: Int) -> Double {
        let ProductQuantity = productPrice * Double(quantity)
        return ProductQuantity
    }
    
    func updatePriceLabel() {
        let updatedPrice = calculatePrice(quantity: quantity)
        ProductQuantity.text = "$\(updatedPrice)"
        countChanged?(Double(updatedPrice))
    }

    @objc func addButtonTapped(_ sender: UIButton) {
        quantity += 1
        updatePriceLabel()
        updateCount()
    }
    
    private func updateCount() {
        itemCountLabel.text = "\(quantity)"
    }

    @objc func subButtonTapped(_ sender: UIButton) {
        if quantity > 1 {
            quantity -= 1
            updatePriceLabel()
        }
    }
    
    
}

   







