//
//  ViewController.swift
//  SneakerShop
//
//  Created by Manas Salimzhan on 01.06.2024.
//

import UIKit

class ProductDetail: UIViewController {
    let constImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "NikeBackground")
        return image
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
        label.text = "Size"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        [constImage, productImage, productPrice, sizeLabel].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        [constImage, productImage, productPrice,sizeLabel].forEach({view.addSubview($0)})
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
            productPrice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21)
            
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
