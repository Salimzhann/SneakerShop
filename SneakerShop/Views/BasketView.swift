//
//  BasketViewController.swift
//  SneakerShop
//
//  Created by Manas Salimzhan on 30.05.2024.
//

import UIKit

class BasketView: UIViewController {
    static let shared = BasketView()
    var productNameArray: [String] = []
    var productSizeArray: [String] = []
    var price: [String] = []
    
    let basketTableView: UITableView = {
        let tv = UITableView()
        tv.rowHeight = 200
        tv.register(BasketTableViewCell.self, forCellReuseIdentifier: BasketTableViewCell.identifier)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadBasketData()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        loadBasketData()
        basketTableView.reloadData()
    }
    
    func setupUI() {
        basketTableView.dataSource = self
        basketTableView.delegate = self
        basketTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(basketTableView)
        
        NSLayoutConstraint.activate([
            basketTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            basketTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            basketTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            basketTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func loadBasketData() {
        let def = UserDefaults.standard
        productNameArray = def.stringArray(forKey: "productNameArray") ?? []
        productSizeArray = def.stringArray(forKey: "productSizeArray") ?? []
        price = def.stringArray(forKey: "priceArray") ?? []
    }

    func saveBasketData() {
        let def = UserDefaults.standard
        def.set(productNameArray, forKey: "productNameArray")
        def.set(productSizeArray, forKey: "productSizeArray")
        def.set(price, forKey: "priceArray")
    }
}



extension BasketView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = basketTableView.dequeueReusableCell(withIdentifier: BasketTableViewCell.identifier, for: indexPath) as! BasketTableViewCell
        print(productNameArray.count)
        cell.configure(name: productNameArray[indexPath.item], size: productSizeArray[indexPath.item], price: price[indexPath.item])
        return cell
    }
    
    
}

