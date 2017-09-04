//
//  ArrayExtension.swift
//  Consorcio
//
//  Created by Diego Cavalcante on 30/05/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import Foundation
import UIKit

extension Array where Element : NSObject {
    
    func next(item : Element)-> Element? {
        if let index = self.index(of: item), index + 1 < self.count {
            return self[index + 1]
        }
        return nil
    }
    
    func previous(item : Element)-> Element? {
        if let index = self.index(of: item), index - 1 >= 0 {
            return self[index - 1]
        }
        return nil
    }
}
