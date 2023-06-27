//
//  BillboardViewController.swift
//  Cinemax
//
//  Created by Bula on 6/10/23.
//

import UIKit

class BillboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getTrendingMovies()
    }
    
    private func getTrendingMovies() {
        APICaller.shared.getTrendingMovies { results in
            switch results {
            case.success(let movies):
                print(movies)
            case.failure(let error):
                print(error)
            }
        }
    }
}
