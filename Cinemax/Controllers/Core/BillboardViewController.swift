//
//  BillboardViewController.swift
//  Cinemax
//
//  Created by Bula on 6/10/23.
//

import UIKit

final class BillboardViewController: UIViewController {
    
    private var baseUIView: BaseUIView?
    
    private let billboardTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(billboardTable)
        view.backgroundColor = .orange
        
        billboardTable.delegate = self
        billboardTable.dataSource = self
        
        baseUIView = BaseUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
        billboardTable.tableHeaderView = baseUIView
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        billboardTable.frame = view.bounds
    }
}

extension BillboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
