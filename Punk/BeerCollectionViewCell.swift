//
//  BeerCollectionViewCell.swift
//  Punk
//
//  Created by Diego Cavalcante on 28/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit
import SDWebImage


class BeerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageBeer    : UIImageView?
    @IBOutlet weak var nameBeer     : UILabel?
    @IBOutlet weak var abvBeer      : UILabel?
    
    var beer : Beer? {
        didSet {
            nameBeer?.text = beer?.name
            abvBeer?.text  = beer?.abv?.str.appending("%")
            
            if let imgUrl = beer?.imageUrl, let url = URL(string: imgUrl) {
                
                imageBeer?.sd_setImage(with: url, placeholderImage: R.image.icBeerPlaceholder())
            }else {
                imageBeer?.image = R.image.icBeerPlaceholder()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
