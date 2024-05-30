//
//  ViewController.swift
//  SneakerShop
//
//  Created by Manas Salimzhan on 29.05.2024.
//

import UIKit

class ViewController: UITabBarController {
    let vc1 = MainPage()
    let vc2 = BasketView()
    let vc3 = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .systemBackground
        
        vc1.title = "Main Page"
        vc2.title = "Basket"
        vc3.title = "Profile"
        
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        nav2.tabBarItem = UITabBarItem(title: "Basket", image: UIImage(systemName: "basket"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 2)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        
        tabBar.tintColor = .black
        
        setViewControllers([nav1,nav2,nav3], animated: true)
    }

}

