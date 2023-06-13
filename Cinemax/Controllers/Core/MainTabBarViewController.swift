//
//  MainTabBarViewController.swift
//  Cinemax
//
//  Created by Bula on 6/10/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.42, green: 0.42, blue: 0.48, alpha: 1.0)
        
        let vc1 = UINavigationController(rootViewController: BillboardViewController())
        let vc2 = UINavigationController(rootViewController: ComingSoonViewController())
        let vc3 = UINavigationController(rootViewController: FoodViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        
        
        vc1.tabBarItem = UITabBarItem(title: "Billboard", image: R.Images.TabBar.billboard, tag: 1)
        vc2.tabBarItem = UITabBarItem(title: "Coming Soon", image: R.Images.TabBar.coming, tag: 2)
        vc3.tabBarItem = UITabBarItem(title: "Food", image: R.Images.TabBar.food, tag: 3)
        vc4.tabBarItem = UITabBarItem(title: "Profile", image: R.Images.TabBar.profile, tag: 4)
        
        
        tabBar.tintColor = .systemRed
        
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
    }
}
