//
//  Beer.swift
//  Punk
//
//  Created by Diego Cavalcante on 28/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import Foundation



class Beer {
    
    var id          = 0
    var name        : String?
    var imageUrl    : String?
    var abv         : Double?
    var ibu         : Int?
    var tagline     : String?
    var desc        : String?
    var beers       : [Beer] = [Beer]()
 
    init() {
        
    }
    
    init?(data : Any) {
        if let jsonArray = data as? JSONArray {
            for json in jsonArray {
                let beer = Beer()
                beer.id         = json["id"] as? Int ?? 0
                beer.name       = json["name"] as? String
                beer.imageUrl   = json["image_url"] as? String
                beer.abv        = json["abv"] as? Double
                beer.desc       = json["description"] as? String
                beer.tagline    = json["tagline"] as? String
                beer.ibu        = json["ibu"] as? Int
                beers.append(beer)
            }
        }
    }
}
