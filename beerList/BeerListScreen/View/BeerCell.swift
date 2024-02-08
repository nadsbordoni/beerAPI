//
//  BeerCell.swift
//  beerList
//
//  Created by nadia on 30/01/24.
//

import Foundation
import UIKit

final class BeerCell: UITableViewCell {
    
    // MARK: UIElements
    
    public lazy var containerView: UIView = {
        let containerView = UIView(frame: .zero)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .lightGray
        containerView.layer.cornerRadius = 8
        return containerView
    }()
    
    public lazy var beerImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public lazy var beerNameLabel: UILabel = {
        let nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    public lazy var beerTaglineLabel: UILabel = {
        let taglineLabel = UILabel(frame: .zero)
        taglineLabel.translatesAutoresizingMaskIntoConstraints = false
        return taglineLabel
    }()
    
    public lazy var verticalStackView: UIStackView = {
        let verticalStackView = UIStackView(arrangedSubviews: [beerNameLabel, beerTaglineLabel])
        verticalStackView.alignment = .fill
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fill
        verticalStackView.spacing = 5.0
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    } ()
    
    // MARK: Layout
    
    func setupCell() {
        self.backgroundColor = .white
        self.addSubview(containerView)
        self.addSubview(beerImageView)
        self.addSubview(verticalStackView)
        setupConstraints()
    }
    
    func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: self.topAnchor,constant: 8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        beerImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        beerImageView.heightAnchor.constraint(equalToConstant: 46).isActive = true
        beerImageView.widthAnchor.constraint(equalToConstant: 46).isActive = true
        beerImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
        verticalStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: beerImageView.trailingAnchor, constant: 4).isActive = true
        self.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
}
