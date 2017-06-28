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
    final fileprivate var page  = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setup()
        setupCollectionViewFlowLayout()
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
    }
    
    final fileprivate func setupCollectionViewFlowLayout() {
        let collectionLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        collectionLayout.scrollDirection         = .vertical
        collectionLayout.minimumInteritemSpacing = 8
        collectionLayout.minimumLineSpacing      = 8
        collectionLayout.sectionInset            = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        let spaces = collectionLayout.minimumInteritemSpacing + collectionLayout.sectionInset.left + collectionLayout.sectionInset.right
        collectionLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - spaces) / 2, height: UIScreen.main.bounds.size.height / 2)
    }
    
    final fileprivate func loadBeers() {
        let service : RestableService<Beer> = RestableService<Beer>(path: R.string.endPoint.httpsApiPunkapiComV2BeersPageDPer_page40(page))
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

extension BeerViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.beerCollectionViewCell.identifier, for: indexPath) as! BeerCollectionViewCell
        cell.beer = beers[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailBeerViewController(beer : beers[indexPath.item]), animated: true)
    }
}

