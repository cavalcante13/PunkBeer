//
//  SearchView.swift
//  Punk
//
//  Created by Diego Cavalcante on 28/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    static func instance()-> SearchView {
        let searchView = R.nib.searchView.firstView(owner: nil) ?? SearchView()
        return searchView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
