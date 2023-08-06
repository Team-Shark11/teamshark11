//
//  ComingSoonViewController.swift
//  Cinemax
//
//  Created by Bula on 6/10/23.
//

import UIKit

class ComingSoonViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate, UICollectionViewDelegate {
    
    
    
    private let viewModel = DropdownViewModel()
    private var selectedOption: String?
    var pickerView: UIPickerView!
    var isDropdownVisible = false
    
    enum Section {
           case main
       }
       
       var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
       var collectionView: UICollectionView! = nil
    


    
    override func viewDidLoad() {
           super.viewDidLoad()
        
            
        
        // Кастом нав бар
           let customNavigationBar = UINavigationBarAppearance()
           customNavigationBar.configureWithOpaqueBackground()
           customNavigationBar.backgroundColor = UIColor(red: 0.086, green: 0.086, blue: 0.129, alpha: 1.0)
           customNavigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
           customNavigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

           
           navigationController?.navigationBar.standardAppearance = customNavigationBar
           navigationController?.navigationBar.scrollEdgeAppearance = customNavigationBar

           // Кастом таб бар
           let customTabBar = UITabBarAppearance()
           customTabBar.configureWithOpaqueBackground()
           customTabBar.backgroundColor = UIColor(red: 0.086, green: 0.086, blue: 0.129, alpha: 1.0)

           
           tabBarController?.tabBar.standardAppearance = customTabBar
           tabBarController?.tabBar.scrollEdgeAppearance = customTabBar

           
        navigationItem.title = "Cinema Tape"
        
            configureHierarchy()
            configureDataSource()
            setupViews()
        
        
           // Ставим делегаты
           pickerView = UIPickerView()
           pickerView.delegate = self
           pickerView.dataSource = self
        
           collectionView?.delegate = self
        
           
           let dropdownButton = createCustomButton(imageName: "line.3.horizontal.decrease.circle.fill", selector: #selector(dropdownButtonTapped))
           navigationItem.leftBarButtonItem = dropdownButton
       }
    
    private func createLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 6
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(0.75))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        section.contentInsetsReference = .layoutMargins
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        // Set the scroll direction to vertical to prevent horizontal scrolling
        layout.configuration.scrollDirection = .vertical
        
        return layout
    }

        
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor(red: 0.086, green: 0.086, blue: 0.129, alpha: 1.0)
        

        collectionView.register(CinemaCell.self, forCellWithReuseIdentifier: CinemaCell.reuseIdentifier)
        view.addSubview(collectionView)
    }


    
    private func configureDataSource() {
           dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
               (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
               
               guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CinemaCell.reuseIdentifier, for: indexPath) as? CinemaCell else { fatalError("Cannot create the cell") }
               
               cell.textLabel.text = "\(identifier)"
               
               return cell
           }
           
           var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
           snapshot.appendSections([.main])
           snapshot.appendItems(Array(1..<11))
           dataSource.apply(snapshot, animatingDifferences: false)
       }
    
        // Кнопка фильтрации
    func createCustomFilterButton(imageName: String, selector: Selector) -> UIBarButtonItem {
           let button = UIButton(type: .system)
           if let image = UIImage(systemName: imageName) {
               button.setImage(image, for: .normal)
           }
           button.tintColor = .white
           button.layer.cornerRadius = 12.9
           button.backgroundColor = UIColor(red: 0.969, green: 0.263, blue: 0.275, alpha: 1.0)
           button.imageView?.contentMode = .scaleAspectFit
           button.contentVerticalAlignment = .fill
           button.contentHorizontalAlignment = .fill
           button.addTarget(self, action: selector, for: .touchUpInside)
           button.frame.size = CGSize(width: 50, height: 50)
           
           let menuBarItem = UIBarButtonItem(customView: button)
           return menuBarItem
       }




    func showDropdown() {
        let dropdownVC = DropdownViewController()
        

        
        
        let navController = UINavigationController(rootViewController: dropdownVC)
        navController.modalPresentationStyle = .overFullScreen
        navController.delegate = self
        
        present(navController, animated: true, completion: nil)
    }
    
    
    @objc func dropdownButtonTapped() {
        viewModel.toggleDropdown()
        if viewModel.isDropdownVisible {
            showDropdown()
        } else {
            hideDropdown()
        }
    }


    func hideDropdown() {
        dismiss(animated: true, completion: nil)
        isDropdownVisible = false
    }


    // MARK: - UIPickerViewDelegate и UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return min(viewModel.dropdownOptions.count, 3)
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.dropdownOptions[row]
    }

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.didSelectOption(at: row)
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
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    @objc private func profileRightButtonTapped() {
           print("button profile pressed")
           
        
           let profileViewController = ProfileViewController()
           
           
           self.navigationController?.pushViewController(profileViewController, animated: true)
       }

    
    //MARK: А здесь ли надо было писать кнопки или в экстеншионах?
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
    
    //*
}

extension ComingSoonViewController: DropdownViewControllerDelegate {
    
    
    func didSelectOption(option: String) {

        print("Selected option: \(option)")
        navigationController?.popViewController(animated: true)
        
    }
    
    
}

extension ComingSoonViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

    }
}
