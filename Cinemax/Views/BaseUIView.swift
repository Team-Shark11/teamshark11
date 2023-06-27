//
//  BaseUIView.swift
//  Cinemax
//
//  Created by Bula on 6/27/23.
//

import UIKit

final class BaseUIView: UIView {
    
    private let servicesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Services", for: .normal)
        button.backgroundColor = R.Colors.baseColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 18
        return button
    }()
    
    private let theatersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Theaters", for: .normal)
        button.backgroundColor = R.Colors.baseColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 18
        return button
    }()
    
    private let promotionsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Know the promotions of Tuesdays & Monday", for: .normal)
        button.backgroundColor = R.Colors.baseColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(servicesButton)
        addSubview(theatersButton)
        addSubview(promotionsButton)
        appplyConstraints()
    }
    
    private func appplyConstraints() {
        let servicesButtonConstraints = [
            servicesButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            servicesButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            servicesButton.widthAnchor.constraint(equalToConstant: 155),
            servicesButton.heightAnchor.constraint(equalToConstant: 56)
        ]
        
        let theatersButtonConstraints = [
            theatersButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            theatersButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            theatersButton.widthAnchor.constraint(equalToConstant: 155),
            theatersButton.heightAnchor.constraint(equalToConstant: 56)
        ]
        
        let promotionsButtonConstraints = [
            promotionsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            promotionsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            promotionsButton.bottomAnchor.constraint(equalTo: theatersButton.bottomAnchor, constant: -90),
            promotionsButton.widthAnchor.constraint(equalToConstant: 330),
            promotionsButton.heightAnchor.constraint(equalToConstant: 107)
        ]
        
        NSLayoutConstraint.activate(servicesButtonConstraints)
        NSLayoutConstraint.activate(theatersButtonConstraints)
        NSLayoutConstraint.activate(promotionsButtonConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
