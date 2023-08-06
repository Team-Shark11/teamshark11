//
//  APICaller.swift
//  Cinemax
//
//  Created by Bula on 6/13/23.
//

import UIKit
import Foundation

class YourViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromAPI()
    }

    func fetchDataFromAPI() {
        if let url = URL(string: "https://www.themoviedb.org/settings/api") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }

                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    print("Error: Invalid HTTP status code: \(httpResponse.statusCode)")
                    return
                }

                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(DropdownModel.self, from: data)
                        DispatchQueue.main.async {
                            // Update your UI components with the data from `decodedData`.
                        }
                    } catch {
                        print("Error decoding data: \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }
}

