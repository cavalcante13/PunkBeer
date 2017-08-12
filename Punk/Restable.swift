//
//  Restable.swift
//  achados
//
//  Created by Diego Cavalcante on 21/05/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import Foundation

public typealias JSON       = [String : Any]
public typealias JSONArray  = [[String : Any]]

protocol Restable {
    var path : String { get set }
}

extension Restable {
    
    func get<T>(parse : @escaping (Any?)-> T?, callback : @escaping (Any?)-> ()) {
        let resourceURL = URL(string: path)!
        let session = URLSession.shared
        session.dataTask(with: resourceURL) { data, _, error in
            let json = data.flatMap {
                try? JSONSerialization.jsonObject(with: $0, options: [])
            }
            DispatchQueue.main.async {
                callback(error == nil ? json.flatMap(parse) : error)
            }
        }.resume()
    }
}
