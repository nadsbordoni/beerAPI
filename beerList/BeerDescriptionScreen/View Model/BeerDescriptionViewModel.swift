//
//  BeerDescriptionViewModel.swift
//  beerList
//
//  Created by nadia on 01/02/24.
//

import Foundation

import Foundation

final class BeerDescriptionViewModel {

    private let coordinator: MainCoordinator
    private var model: BeerDescriptionModel
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.model = BeerDescriptionModel(beerName: "", beerTagline: "", beerDescription: "")
    }
    
}
