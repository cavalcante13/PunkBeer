//
//  Beer.swift
//  Punk
//
//  Created by Diego Cavalcante on 28/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import Foundation



class Beer : NSObject {
    
    // maintain a weak reference
    var name        : String?
    var imageUrl    : String?
    var abv         : Double?
    var ibu         : Int?
    var tagline     : String?
    var desc        : String?
    var beers       : [Beer] = [Beer]()
    
    override init() {}
}

extension Beer {
    
    convenience init?(data : Any) {
        self.init()
        if let jsonArray = data as? JSONArray {
            
            for json in jsonArray {
                let beer = Beer()
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
