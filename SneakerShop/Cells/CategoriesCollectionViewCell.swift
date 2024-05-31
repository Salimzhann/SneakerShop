//
//  CategoriesCollectionViewCell.swift
//  SneakerShop
//
//  Created by Manas Salimzhan on 31.05.2024.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "CategoriesCell"
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 18
        button.layer.masksToBounds = true
        button.setBackgroundColor(.white, for: .normal)
        button.setBackgroundColor(.black, for: .selected)
        return button
    }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           contentView.addSubview(button)
           
           NSLayoutConstraint.activate([
               button.topAnchor.constraint(equalTo: contentView.topAnchor),
               button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
               button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
               button.heightAnchor.constraint(equalToConstant: 32) // Adjust the height as needed
           ])
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
