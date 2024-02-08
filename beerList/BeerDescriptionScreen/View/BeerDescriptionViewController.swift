//
//  BeerDescriptionViewController.swift
//  beerList
//
//  Created by nadia on 01/02/24.
//

import Foundation
import UIKit

final class BeerDescriptionViewController: UIViewController {
    
    // MARK: UIElements
    
    private let beerImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
   private lazy var beerNameLabel: UILabel = {
        let nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private lazy var beerTaglineLabel: UILabel = {
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
    
    private lazy var beerDescriptionLabel: UILabel = {
        let descriptionLabel = UILabel(frame: .zero)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .justified
        return descriptionLabel
    }()
    
    private let viewModel: BeerDescriptionViewModel
    
    // MARK: Lifecycle
    
    init(viewModel: BeerDescriptionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(beerImageView)
        view.addSubview(verticalStackView)
        view.addSubview(beerDescriptionLabel)
        setupViewConstraints()
        setupUI()
    }
    
    private func setupUI () {
        self.view.backgroundColor = .white
        beerImageView.image = UIImage(named: "nadia")
        beerNameLabel.text = "Nome da Cerveja"
        beerTaglineLabel.text = "A Real Bitter Experience"
        beerDescriptionLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    }
    
    private func setupViewConstraints() {
        beerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        beerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        beerImageView.heightAnchor.constraint(equalToConstant: 74).isActive = true
        beerImageView.widthAnchor.constraint(equalToConstant: 74).isActive = true
        
        verticalStackView.leadingAnchor.constraint(equalTo: beerImageView.trailingAnchor, constant: 16).isActive = true
        verticalStackView.topAnchor.constraint(equalTo: beerImageView.topAnchor).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        beerDescriptionLabel.topAnchor.constraint(equalTo: beerImageView.bottomAnchor, constant: 33).isActive = true
        beerDescriptionLabel.leadingAnchor.constraint(equalTo: beerImageView.leadingAnchor).isActive = true
        beerDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        beerDescriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        
    }
    
    
}
