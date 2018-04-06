//
//  BeerViewController.swift
//  Punk
//
//  Created by Diego Cavalcante on 27/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit

let strings = R.string.endPoint.self

final class BeerViewController: UIViewController, HomeBeerPresenterDelegate {
    
    //Mark: private properties
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate            = self
            collectionView.dataSource          = self
            collectionView.backgroundColor     = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
            collectionView.register(R.nib.beerCollectionViewCell)
            collectionView.register(R.nib.loadMoreCollectionViewCell)
        }
    }
    
    var presenter : HomeBeerPresenter!
    
    //Init the view controller and presenter
    init() {
        presenter = HomeBeerPresenter(service: Service<Beer>(url: strings.httpsApiPunkapiComV2BeersPageDPer_pageD(1, 20), parse: Beer.init))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = R.string.beer.cervejas()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { [weak self] context in
            if let `self` = self {
                `self`.collectionView.collectionViewLayout.invalidateLayout()
            }
        }, completion: nil)
    }
    
    func presenter(_ presenter: HomeBeerPresenter, result: Result<Any>) {
        
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
        return presenter.page < presenter.maxPage ? presenter.numberOfBeers() + 1 : presenter.numberOfBeers()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < presenter.numberOfBeers() {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.beerCollectionViewCell.identifier, for: indexPath) as! BeerCollectionViewCell
            cell.beer = presenter.beer(indexPath.item)
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.loadMoreCollectionViewCell.identifier, for: indexPath)
            presenter.makeRequestBeers()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailBeerViewController(beer : presenter.beer(indexPath.item)), animated: true)
    }
}

