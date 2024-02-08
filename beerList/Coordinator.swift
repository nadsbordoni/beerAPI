//
//  Coordinator.swift
//  beerList
//
//  Created by nadia on 30/01/24.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    func start()
    
}
