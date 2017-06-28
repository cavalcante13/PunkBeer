//
//  BeerViewController.swift
//  Punk
//
//  Created by Diego Cavalcante on 27/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit

final class BeerViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    final fileprivate var beers : [Beer] = [Beer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setup()
        loadBeers()
    }
    
    final fileprivate func registerCells() {
        collectionView.register(R.nib.beerCollectionViewCell)
    }
    
    final fileprivate func setup() {
        navigationItem.title               = R.string.beer.cervejas()
        collectionView.delegate            = self
        collectionView.dataSource          = self
        collectionView.backgroundColor     = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
        
        let collectionLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        collectionLayout.scrollDirection         = .vertical
        collectionLayout.minimumInteritemSpacing = 8
        collectionLayout.minimumLineSpacing      = 8
        collectionLayout.sectionInset            = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

        let spaces = collectionLayout.minimumInteritemSpacing + collectionLayout.sectionInset.left + collectionLayout.sectionInset.right
        collectionLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - spaces) / 2, height: UIScreen.main.bounds.size.height / 2)
    }

    final fileprivate func loadBeers() {
        let service : RestableService<Beer> = RestableService<Beer>(path: "https://api.punkapi.com/v2/beers?page=2&per_page=80")
        service.get(parse: Beer.init, callback: callBack())
    }
    
    final fileprivate func callBack()-> (Any)-> () {
        return { [weak self] callback in
            if let context = self {
                if let beer = callback as? Beer {
                    context.beers += beer.beers
                    context.collectionView.reloadData()
                }else if let error = callback as? Error {
                    print(error)
                }
            }
        }
    }
}

//MARK: -- UICollectionViewDelegateFlowLayout
extension BeerViewController : UICollectionViewDelegateFlowLayout {
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionFlowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let spaces = collectionFlowLayout.minimumInteritemSpacing + collectionFlowLayout.sectionInset.left + collectionFlowLayout.sectionInset.right
        print(collectionFlowLayout.minimumInteritemSpacing)
        print(collectionFlowLayout.minimumLineSpacing)
        print(collectionFlowLayout.sectionInset.left)
        print(collectionFlowLayout.sectionInset.right)
        print(CGSize(width: (collectionView.bounds.size.width) / 2, height: UIScreen.main.bounds.size.height / 2))
        print(CGSize(width: (collectionView.bounds.size.width - 24) / 2, height: UIScreen.main.bounds.size.height / 2))
        return CGSize(width: (collectionView.bounds.size.width * 0.50) - 1, height: UIScreen.main.bounds.size.height / 2)
    }
 */
}

//MARK: -- UICollectionViewDelegate, UICollectionViewDataSource
extension BeerViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.beerCollectionViewCell.identifier, for: indexPath) as! BeerCollectionViewCell
        cell.beer = beers[indexPath.item]
        return cell
    }
}

