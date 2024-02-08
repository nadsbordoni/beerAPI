//
//  BeerListViewModel.swift
//  beerList
//
//  Created by nadia on 30/01/24.
//

import Foundation
import Combine

final class BeerListViewModel {
    
    private let coordinator: MainCoordinator
    private var model: BeerListModel
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.model = BeerListModel(beerName: "", beerTagline: "")
    }
    
    public func presentDescriptionScreen() {
        coordinator.showBeerDescriptionScreen()
    }
    
    func getBeers() -> Future<[Beer], Error> {
        return Future { promise in
            ServiceLayer().apiRequest { completion in
                switch completion {
                case .success(let response):
                    promise(.success(response))
                case .failure(let failure):
                    promise(.failure(failure))
                }
            }
        }
    }
    
}
