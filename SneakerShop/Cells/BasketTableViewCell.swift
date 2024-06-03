//
//  BasketTableViewCell.swift
//  SneakerShop
//
//  Created by Manas Salimzhan on 03.06.2024.
//

import UIKit

class BasketTableViewCell: UITableViewCell {
    static let identifier: String = "BasketCell"
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        return button
    }()
    
    let productName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configure(name: String, size: String, price: String) {
        
        productName.text = name
        productImage.image = UIImage(named: name)
        sizeLabel.text = "size: \(size)"
        priceLabel.text = "price: \(price)"
        [buyButton, productName, productImage,sizeLabel, priceLabel].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        [buyButton, productName,priceLabel, productImage,sizeLabel].forEach({self.addSubview($0)})
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            productImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            productImage.heightAnchor.constraint(equalToConstant: 180),
            productImage.widthAnchor.constraint(equalToConstant: 150),
            
            productName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 15),
        
            sizeLabel.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 5),
            sizeLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 15),
            
            priceLabel.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 15),
            
            buyButton.topAnchor.constraint(equalTo: priceLabel.topAnchor , constant: 40),
            buyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            buyButton.heightAnchor.constraint(equalToConstant: 40),
            buyButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

}
