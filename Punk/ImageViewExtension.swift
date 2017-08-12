//
//  ImageViewExtension.swift
//  Punk
//
//  Created by Diego Cavalcante on 16/07/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import Foundation
import UIKit



protocol ImageViewRestable {
    func load(url : String)
}

extension ImageViewRestable where Self : UIImageView {
    
    func load(url : String) {
        let resourceURL = URL(string: url)!
        let session = URLSession.shared
        session.dataTask(with: resourceURL) { data, response, error in
            
            if response?.mimeType == "image/image", error == nil {
                
            }
            
        }.resume()
    }
}
