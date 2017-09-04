//
//  BeerViewController.swift
//  Punk
//
//  Created by Diego Cavalcante on 27/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit

let strings = R.string.endPoint.self

final class BeerViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    final fileprivate var beers : [Beer] = [Beer]()
    
    final fileprivate var page         = 1
    final fileprivate var maxPage      = 1
    final fileprivate var limitPerPage = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setup()
        loadBeers()
    }
    
    final fileprivate func registerCells() {
        collectionView.register(R.nib.beerCollectionViewCell)
        collectionView.register(R.nib.loadMoreCollectionViewCell)
    }
    
    final fileprivate func setup() {
        navigationItem.title               = R.string.beer.cervejas()
        collectionView.delegate            = self
        collectionView.dataSource          = self
        collectionView.backgroundColor     = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
    }
   
    final internal func loadBeers() {
        AppStyle.startActivityIndicator()

        let service : Service<Beer> = Service(url: URL(string : strings.httpsApiPunkapiComV2BeersPageDPer_pageD(self.page, self.limitPerPage))!, parse: Beer.init)
        
        service.get(completion: responseBeer())
    }
    
    final internal func responseBeer()-> (Beer?)-> () {
        return { [weak self] beer in
            if let beer = beer {
                self?.beers += beer.beers
                self?.adjustMaxPages(with: (self?.beers.count)!)
                self?.collectionView.reloadData()
            }else {
                self?.confirmAlert(title: "Erro", description: "", action: nil)
            }
            AppStyle.stopActivityIndicator()
        }
    }
    
    
    final internal func adjustMaxPages(with totalItens : Int) {
        page += 1
        maxPage = totalItens % limitPerPage == 0 ? page + 1 : page
    }
    
    final fileprivate func resetPages() {
        page    = 1
        maxPage = 1
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { [weak self] context in
            self?.collectionView?.collectionViewLayout.invalidateLayout()
            }, completion: nil)
    }
}
extension BeerViewController : UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.sectionInset  = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        let columns: Int = {
            var count = 2
            if traitCollection.horizontalSizeClass == .regular              { count += 1 }
            if collectionView.bounds.width > collectionView.bounds.height   { count += 1 }
            return count
        }()
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(columns - 1))
        
        let width = Int((collectionView.bounds.width - totalSpace) / CGFloat(columns))
        return CGSize(width: CGFloat(width), height: traitCollection.verticalSizeClass == .compact ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.height / 2)
    }
}

extension BeerViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return page < maxPage ? beers.count + 1 : beers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < beers.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.beerCollectionViewCell.identifier, for: indexPath) as! BeerCollectionViewCell
            cell.beer = beers[indexPath.item]
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.loadMoreCollectionViewCell.identifier, for: indexPath)
            loadBeers()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailBeerViewController(beer : beers[indexPath.item]), animated: true)
    }
}

