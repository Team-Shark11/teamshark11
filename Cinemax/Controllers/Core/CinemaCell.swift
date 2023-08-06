//
//  CinemaCell.swift
//  Cinemax
//
//  Created by Андрей Василинич on 02.08.2023.
//

import UIKit

class CinemaCell: UICollectionViewCell {
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let reuseIdentifier = "CinemaCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLabel)
        
        // Constraints for the textLabel to be centered in the cell
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        // Additional cell customization
        layer.borderColor = CGColor(red: 0.969, green: 0.263, blue: 0.275, alpha: 1.0)
        layer.borderWidth = 1.0
        textLabel.textColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        textLabel.text = "\(text)"
    }
}
