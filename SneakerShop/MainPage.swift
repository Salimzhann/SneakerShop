//
//  MainPageViewController.swift
//  SneakerShop
//
//  Created by Manas Salimzhan on 30.05.2024.
//

import UIKit

class MainPage: UIViewController {
    
    let saleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(SaleCell.self, forCellWithReuseIdentifier: SaleCell.identifier)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSaleCollectionView()
    }
    

    func setupUI() {
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"),style: .plain, target: self, action: #selector(handleMenu))
        navigationItem.leftBarButtonItem = menuButton
        menuButton.tintColor = .black
        
        [saleCollectionView].forEach({view.addSubview($0)})
        [saleCollectionView].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            saleCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            saleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saleCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        
    }
    
    @objc func handleMenu() {
        
    }
    
    func setupSaleCollectionView() {
        saleCollectionView.dataSource = self
        saleCollectionView.delegate = self
    }

}


extension MainPage: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = saleCollectionView.dequeueReusableCell(withReuseIdentifier: SaleCell.identifier, for: indexPath) as! SaleCell
        cell.configure(with: "saleImage_1")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 50, height: 150)
    }
    
    
}
