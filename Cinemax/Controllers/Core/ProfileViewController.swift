//
//  ProfileViewController.swift
//  Cinemax
//
//  Created by Bula on 6/10/23.
//

import UIKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate {
    
    private let viewModel = DropdownViewModel()
    var isDropdownVisible = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customNavigationBar = UINavigationBarAppearance()
        
        customNavigationBar.configureWithOpaqueBackground()
        customNavigationBar.backgroundColor = UIColor(red: 0.086, green: 0.086, blue: 0.129, alpha: 1.0)
        customNavigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        customNavigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        
        navigationController?.navigationBar.standardAppearance = customNavigationBar
        navigationController?.navigationBar.scrollEdgeAppearance = customNavigationBar
        
        navigationItem.title = "Profile"
        
        setupViews()
        
    }
    

    
    private func setupViews() {
        createCustomNavigationBar()
        
        let profileRightButton = createCustomButton(imageName: "brain.head.profile",
                                              selector: #selector(profileRightButtonTapped)
        )
        let searchButton = createCustomButton(imageName: "magnifyingglass.circle",
                                                    selector: #selector(searchRightButtonTapped)
        )
        navigationItem.rightBarButtonItems = [profileRightButton, searchButton]
    }
    
    
    @objc private func searchRightButtonTapped() {
        print("Hello World")
        
    }
    @objc private func profileRightButtonTapped() {
           print("button profile pressed")
           
           // Создайте экземпляр ProfileViewController
           let profileViewController = ProfileViewController()
           
           // Выполните переход на экран ProfileViewController
           self.navigationController?.pushViewController(profileViewController, animated: true)
       }
    
    
    func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(
            UIImage(systemName: imageName),
            for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 12.9
        button.backgroundColor = UIColor(red: 0.969, green: 0.263, blue: 0.275, alpha: 1.0)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.frame.size = .init(width: 50, height: 50)
        
        
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
        
    }
    
    func createCustomNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
    }
    
}
