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
    
    let saleSegment: UIPageControl = {
        let page = UIPageControl()
        page.numberOfPages = 5
        page.pageIndicatorTintColor = .gray
        page.currentPageIndicatorTintColor = .black
        return page
    }()
    
    let categories: [String] = ["All", "Running", "Sneakers", "Formal", "Casual"]
    var selectedCategoryIndex = 0
    
    let typeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
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
        
        [saleCollectionView, saleSegment, typeCollectionView].forEach({view.addSubview($0)})
        [saleCollectionView, saleSegment, typeCollectionView].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            saleCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            saleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saleCollectionView.heightAnchor.constraint(equalToConstant: 150),
            
            saleSegment.topAnchor.constraint(equalTo: saleCollectionView.bottomAnchor, constant: 5),
            saleSegment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            typeCollectionView.topAnchor.constraint(equalTo: saleSegment.bottomAnchor, constant: 10),
            typeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            typeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            typeCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
    }
    
    @objc func handleMenu() {
        
    }
    
    func setupSaleCollectionView() {
        saleCollectionView.dataSource = self
        saleCollectionView.delegate = self
        
        typeCollectionView.dataSource = self
        typeCollectionView.delegate = self
    }

}


extension MainPage: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == saleCollectionView {
            return 5
        }else if collectionView == typeCollectionView {
            return categories.count
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == saleCollectionView {
            let cell = saleCollectionView.dequeueReusableCell(withReuseIdentifier: SaleCell.identifier, for: indexPath) as! SaleCell
            cell.configure(with: "saleImage_\(indexPath.item)")
            return cell
        } else {
            let cell = typeCollectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as! CategoriesCollectionViewCell
            cell.button.setTitle(categories[indexPath.item], for: .normal)
            cell.button.isSelected = indexPath.item == selectedCategoryIndex
            cell.button.addTarget(self, action: #selector(categoryButtonTapped(_:)), for: .touchUpInside)
            return cell
        }
    }
    
    @objc func categoryButtonTapped(_ sender: UIButton) {
            guard let indexPath = typeCollectionView.indexPath(for: sender.superview!.superview as! UICollectionViewCell) else { return }
            selectedCategoryIndex = indexPath.item
            typeCollectionView.reloadData()
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == saleCollectionView {
            return CGSize(width: view.frame.width - 50, height: 150)
        } else {
            let label = UILabel()
            label.text = categories[indexPath.item]
            label.sizeToFit()
            return CGSize(width: label.frame.width + 20, height: 40)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
           saleSegment.currentPage = Int(pageIndex)
       }
    
    
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        let minimumSize: CGSize = CGSize(width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(minimumSize)
        defer { UIGraphicsEndImageContext() }
        
        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: minimumSize))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        setBackgroundImage(image, for: state)
    }
}
