//
//  DeletePopUpViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 23/04/2023.
//

import UIKit

class DeletePopUpViewController: UIViewController {
        
    private let deleteView:UIView = {
        let deleteStackView = UIView ()
        deleteStackView.translatesAutoresizingMaskIntoConstraints = false
        deleteStackView.layer.cornerRadius = 16
        return deleteStackView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Delete from cart"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    private let deleteLabel: UILabel = {
        let deleteTextLabel = UILabel()
        deleteTextLabel.text = "Are you sure you want to delete item(s)."
        deleteTextLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteTextLabel.textAlignment = .center
        deleteTextLabel.font = .systemFont(ofSize: 14, weight: .bold)
        deleteTextLabel.textColor = .gray
        return deleteTextLabel
    }()
    
    private let cancelButton: UIButton = {
        let cancelbtn = UIButton()
        cancelbtn.translatesAutoresizingMaskIntoConstraints = false
        
        cancelbtn.setTitle("CANCEL", for: .normal)
        cancelbtn.setTitleColor(.white, for: .normal)
        cancelbtn.backgroundColor = .darkGray
        cancelbtn.layer.cornerRadius = 14
        cancelbtn.clipsToBounds = true
        return cancelbtn
    
    }()
    // add cancel icon
    private let cancelImage: UIImageView = {
        let cancelImg = UIImageView()
        cancelImg.image = UIImage(systemName: "xmark")
        cancelImg.tintColor = .black
        cancelImg.translatesAutoresizingMaskIntoConstraints = false
        cancelImg.isUserInteractionEnabled = true
        return cancelImg
    }()
    
    
    private let deleteButton: UIButton = {
        let deletebtn = UIButton()
        deletebtn.setTitle("DELETE", for: .normal)
        deletebtn.translatesAutoresizingMaskIntoConstraints = false
        deletebtn.setTitleColor(.white, for: .normal)
        deletebtn.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        deletebtn.layer.cornerRadius = 14
        deletebtn.clipsToBounds = true
        return deletebtn
        
    }()

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCancelImageTap))
        cancelImage.addGestureRecognizer(tapGesture)
        
        
        
        // create a image button view (x from sfsymbol)
//        cancelButton.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
        cancelButton.addTarget(self, action: #selector(dismissVc), for: .touchUpInside)
                
//                deleteButton.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
        
    }
    
    func setupView() {
        view.backgroundColor = .clear
        
    }
    
    @objc func handleCancelImageTap(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)

        
    }
    @objc func dismissVc() {
        self.dismiss(animated: true)
    }
    
    func setupConstraints() {
        view.addSubview(deleteView)
        deleteView.backgroundColor = .white
        deleteView.addSubview(titleLabel)
        deleteView.addSubview(deleteLabel)
        deleteView.addSubview(cancelButton)
        deleteView.addSubview(deleteButton)
        deleteView.addSubview(cancelImage)
        
        
        NSLayoutConstraint.activate([
            
           
            //pin deleteview
            
            deleteView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            deleteView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            deleteView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            deleteView.heightAnchor.constraint(equalToConstant: 200),
            
            // pin titleLabel
            titleLabel.topAnchor.constraint(equalTo: deleteView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: deleteView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: deleteView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            
            // pin deleteLabel
            deleteLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            deleteLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            deleteLabel.heightAnchor.constraint(equalToConstant: 140),
            
           //pin cancel button
            cancelButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 140),
            cancelButton.heightAnchor.constraint(equalToConstant: 50),
            
            //pin delete button
            deleteButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -20),
            deleteButton.widthAnchor.constraint(equalToConstant: 140),
            deleteButton.heightAnchor.constraint(equalToConstant: 50),
            
//          pin cancel icon
            
            cancelImage.topAnchor.constraint(equalTo: self.deleteView.topAnchor, constant: 10),
            cancelImage.trailingAnchor.constraint(equalTo: self.deleteView.trailingAnchor, constant: -10),
            cancelImage.heightAnchor.constraint(equalToConstant: 24),
            cancelImage.widthAnchor.constraint(equalToConstant: 24)

            
            
            
        ])
        
        
        
        
        
    }
    
    
    
    
}
