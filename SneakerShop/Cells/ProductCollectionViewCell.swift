//
//  ProductCollectionViewCell.swift
//  SneakerShop
//
//  Created by Manas Salimzhan on 31.05.2024.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ProductCell"
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        return view
    }()
    
    let mainTitle: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return title
    }()
    
    let priceTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 18
        [mainTitle, priceTitle, image, ].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        self.addSubview(backView)
        [mainTitle, priceTitle, image].forEach({self.addSubview($0)})
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: -5),
            image.widthAnchor.constraint(equalToConstant: 160),
            image.heightAnchor.constraint(equalToConstant: 160),
            
            mainTitle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 2),
            mainTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            priceTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 2),
            priceTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
    
    func configure(name: String, price: String) {
        image.image = UIImage(named: name)
        mainTitle.text = name
        priceTitle.text = "$\(price)"
    }
}
