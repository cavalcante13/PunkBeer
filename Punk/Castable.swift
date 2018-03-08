//
//  Castable.swift
//  Punk
//
//  Created by Diego Cavalcante on 28/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import Foundation
import UIKit


protocol Castable {}

extension Castable {
    var str : String {
        get {
            return String(describing: self)
        }
    }
}

extension Double : Castable {}
extension Int    : Castable {}
extension Float  : Castable {}
