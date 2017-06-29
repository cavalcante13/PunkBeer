//
//  DetailBeerViewController.swift
//  Punk
//
//  Created by Diego Cavalcante on 28/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit

class DetailBeerViewController: UIViewController {
    @IBOutlet weak var imageBeer    : UIImageView?
    @IBOutlet weak var nameBeer     : UILabel?
    @IBOutlet weak var abvBeer      : UILabel?
    @IBOutlet weak var taglineBeer  : UILabel?
    @IBOutlet weak var ibuBeer      : UILabel?
    @IBOutlet weak var descBeer     : UILabel?
    
    private var beer : Beer
    
    //This ViewController has size class for landscape, the Discription change the position when landscape active.
    //Please see in Interface Builder
    
    init(beer : Beer) {
        self.beer = beer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    final fileprivate func setup() {
        nameBeer?.text = beer.name
        abvBeer?.text  = beer.abv?.str.appending("%")
        ibuBeer?.text  = beer.ibu?.str.appending("%")
        descBeer?.text = beer.desc
        taglineBeer?.text = beer.tagline
        
        if let imgUrl = beer.imageUrl, let url = URL(string: imgUrl) {
            imageBeer?.sd_setImage(with: url, placeholderImage: R.image.icBeerPlaceholder())
        }else {
            imageBeer?.image = R.image.icBeerPlaceholder()
        }

    }
}
