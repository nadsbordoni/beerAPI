//
//  MainCoordinator.swift
//  beerList
//
//  Created by nadia on 30/01/24.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    
    func start() {
        let viewModel = BeerListViewModel(coordinator: self)
        let vc = BeerListViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }

    func showBeerDescriptionScreen() {
        let viewModel = BeerDescriptionViewModel(coordinator: self)
        let vc = BeerDescriptionViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
