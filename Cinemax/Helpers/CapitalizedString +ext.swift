//
//  CapitalizedString +ext.swift
//  Cinemax
//
//  Created by Bula on 6/27/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
