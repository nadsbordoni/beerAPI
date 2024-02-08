//
//  ServiceLayer.swift
//  beerList
//
//  Created by nadia on 02/02/24.
//

import Foundation
import UIKit
import Network

enum HttpsMethod: String {
    case GET
    case POST
    case DELETE
    case PATCH
}
class ServiceLayer {
    let urlBase = "https://api.punkapi.com/v2/beers"
    
    func apiRequest(handler: @escaping(Result<[Beer], Error>) -> Void)  {
        guard let urlBase = URL(string: urlBase) else { return }
        var request = URLRequest(url: urlBase)
        request.httpMethod = HttpsMethod.GET.rawValue
        var beersArray = [Beer]()
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let beers = try? JSONDecoder().decode([Beer].self, from: data) {
                    beersArray = beers
                    return handler(.success(beersArray))
                }
            }
        }
        task.resume()
    }
}
