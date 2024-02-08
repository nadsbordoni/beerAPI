//
//  BeerListViewController.swift
//  beerList
//
//  Created by nadia on 30/01/24.
//

import Foundation
import UIKit
import Combine

final class BeerListViewController: UIViewController {
    
    // MARK: UIElements
    
    private lazy var beerListTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let viewModel: BeerListViewModel
    private var cancellables = Set<AnyCancellable>()
    var beers = [Beer]()
    
    // MARK: Lifecycle
    
    init(viewModel: BeerListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchBeers()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: Layout
    
    private func setupTableView() {
        beerListTableView.dataSource = self
        beerListTableView.delegate = self
        view.addSubview(beerListTableView)
        setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        beerListTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        beerListTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        beerListTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive  = true
        beerListTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
}

extension BeerListViewController {
    func fetchBeers() {
        viewModel.getBeers().sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error)
                break
            }
        } receiveValue: { result in
            DispatchQueue.main.async {
                self.beers = result
                self.beerListTableView.reloadData()
            }
        }.store(in: &cancellables)

    }
}

extension BeerListViewController: UITableViewDelegate {
    private func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return UITableView.automaticDimension
    }


    private func tableView(tableView: UITableView!, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return UITableView.automaticDimension
    }

}
extension BeerListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BeerCell()
        cell.beerNameLabel.text = "Teste"
        cell.beerTaglineLabel.text = "Teste"
        cell.beerImageView.image = UIImage(named: "nadia")
        cell.accessoryType = .disclosureIndicator
        cell.setupCell()

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.presentDescriptionScreen()
    }

}
  
