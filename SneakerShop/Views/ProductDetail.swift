//
//  ViewController.swift
//  SneakerShop
//
//  Created by Manas Salimzhan on 01.06.2024.
//

import UIKit

class ProductDetail: UIViewController {
     var productName = ""
    let BasketButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to basket", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(basketHandler), for: .touchUpInside)
        return button
    }()
    let constImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "NikeBackground")
        return image
    }()
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        return button
        
    }()
    
    let productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let productPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "size"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    var sizeText = ""
    
    let sizeButtons:[UIButton] = {
        let button1 = UIButton()
        button1.setTitle("UK 41", for: .normal)
        button1.layer.cornerRadius = 12
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button1.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        button1.setTitleColor(.black, for: .normal)
        
        let button2 = UIButton()
        button2.setTitle("UK 42", for: .normal)
        button2.layer.cornerRadius = 12
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button2.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        button2.setTitleColor(.black, for: .normal)
        
        let button3 = UIButton()
        button3.setTitle("UK 43", for: .normal)
        button3.layer.cornerRadius = 12
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.lightGray.cgColor
        button3.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        button3.setTitleColor(.black, for: .normal)
        
        let button4 = UIButton()
        button4.setTitle("UK 44", for: .normal)
        button4.layer.cornerRadius = 12
        button4.layer.borderWidth = 1
        button4.layer.borderColor = UIColor.lightGray.cgColor
        button4.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        button4.setTitleColor(.black, for: .normal)
        
        return [button1, button2, button3, button4]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        [constImage, productImage, productPrice, sizeLabel,buyButton,BasketButton, sizeButtons[0],sizeButtons[1],sizeButtons[2],sizeButtons[3]].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        [constImage, productImage, productPrice,sizeLabel,buyButton,BasketButton, sizeButtons[0],sizeButtons[1],sizeButtons[2],sizeButtons[3]].forEach({view.addSubview($0)})
        NSLayoutConstraint.activate([
            constImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            constImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            constImage.heightAnchor.constraint(equalToConstant: 106.83),
            constImage.widthAnchor.constraint(equalToConstant: 112.7),
            
            productImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            productImage.heightAnchor.constraint(equalToConstant: 350),
            productImage.widthAnchor.constraint(equalToConstant: 350),
            
            productPrice.topAnchor.constraint(equalTo: view.topAnchor, constant: 521),
            productPrice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            
            sizeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            sizeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            
            sizeButtons[0].topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 10),
            sizeButtons[0].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.2),
            sizeButtons[1].topAnchor.constraint(equalTo: sizeButtons[0].bottomAnchor, constant: 5),
            sizeButtons[1].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.2),
            sizeButtons[2].topAnchor.constraint(equalTo: sizeButtons[1].bottomAnchor, constant: 5),
            sizeButtons[2].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.2),
            sizeButtons[3].topAnchor.constraint(equalTo: sizeButtons[2].bottomAnchor, constant: 5),
            sizeButtons[3].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.2),
            
            BasketButton.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 15),
            BasketButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            BasketButton.heightAnchor.constraint(equalToConstant: 60),
            BasketButton.widthAnchor.constraint(equalToConstant: 150),
            
            buyButton.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 15),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
            buyButton.heightAnchor.constraint(equalToConstant: 60),
            buyButton.widthAnchor.constraint(equalToConstant: 150)
            
        ])
        for button in sizeButtons {
            button.addTarget(self, action: #selector(sizeIsSelected(_:)), for: .touchUpInside)
        }
    }
    
    @objc func sizeIsSelected(_ sender: UIButton) {
        for button in sizeButtons {
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.borderWidth = 1
            button.setTitleColor(.black, for: .normal)
        }
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 2
        
        sizeText = sender.titleLabel?.text ?? ""
    }
    
    @objc func basketHandler() {
        guard sizeText.isEmpty == false else {
            showAlert()
            return
        }
        let basketVC = BasketView.shared
        basketVC.productNameArray.append(productName)
        basketVC.productSizeArray.append(sizeText)
        basketVC.price.append(productPrice.text!)
        basketVC.basketTableView.reloadData()
        let defaults = UserDefaults.standard
               defaults.set(BasketView.shared.productNameArray, forKey: "productNameArray")
               defaults.set(BasketView.shared.productSizeArray, forKey: "productSizeArray")
               defaults.set(BasketView.shared.price, forKey: "priceArray")
               
               // Ensure the data is actually added
               print(BasketView.shared.productNameArray)
               print(BasketView.shared.productSizeArray)
               print(BasketView.shared.price)
        
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Error", message: "Size is not selected. Please select a size.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        if let topController = UIApplication.shared.keyWindow?.rootViewController {
            topController.present(alertController, animated: true, completion: nil)
        }
    }
}
