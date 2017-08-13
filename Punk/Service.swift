//
//  Service.swift
//  Punk
//
//  Created by Diego Cavalcante on 12/08/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import Foundation



struct Service<T> {
    let url     : URL
    let parse   : (Any)-> T?
    
    func get(completion : @escaping (T?)->()) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let json = data.flatMap {
                try? JSONSerialization.jsonObject(with: $0, options: [])
            }
            DispatchQueue.main.async {
                completion(json.flatMap(self.parse))
            }
        }.resume()
    }
}
