//
//  Service.swift
//  Punk
//
//  Created by Diego Cavalcante on 12/08/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import Foundation


public typealias JSON       = [String : Any]
public typealias JSONArray  = [[String : Any]]

enum Result<T> {
    case success(T)
    case failure(NSError)
}

struct Service<Result> {

    let url     : String
    let parse   : (Any)-> Result?
    
    func get(completion : @escaping (Result?)->()) {
        
        guard
            let  url = URL(string : url) else {
            fatalError("url invalid")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let json = data.flatMap { try? JSONSerialization.jsonObject(with: $0, options: []) }
            
            DispatchQueue.main.async {
                completion(json.flatMap(self.parse))
            }
        }.resume()
    }
}
