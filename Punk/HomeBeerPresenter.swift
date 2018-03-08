//
//  HomeBeerPresenter.swift
//  Punk
//
//  Created by Diego on 08/03/18.
//  Copyright © 2018 Diego Cavalcante. All rights reserved.
//

import UIKit


protocol HomeBeerPresenterDelegate : class {
    func presenter(_ presenter : HomeBeerPresenter, result : Result<Any>)
}

final class HomeBeerPresenter: NSObject {

    final private var beers : [Beer] = []
    
    final var page         = 1
    final var maxPage      = 1
    final var limitPerPage = 20
    
    weak var delegate : HomeBeerPresenterDelegate?
    
    final var numberOfBeers : ()-> Int {
        return { return self.beers.count }
    }
    
    final var beer : (Int)-> Beer {
        return  { return self.beers[$0] }
    }
    
    init(service : Service<Beer>) {
        super.init()
        service.get(completion: responseBeer())
    }
    
    override init() {
        super.init()
        makeRequestBeers()
    }

    final internal func makeRequestBeers() {
        AppStyle.startActivityIndicator()
        
        let service : Service<Beer> = Service(url: strings.httpsApiPunkapiComV2BeersPageDPer_pageD(self.page, self.limitPerPage), parse: Beer.init)
        
        service.get(completion: responseBeer())
    }
    
    final internal func responseBeer()-> (Beer?)-> () {
        return { [weak self] beer in
            if let beer = beer, let `self` = self {
                `self`.beers += beer.beers
                `self`.adjustMaxPages(with: (`self`.numberOfBeers()))
                `self`.delegate?.presenter(self, result: Result.success(beer))
            }else {
                guard let `self` = self else { return }
                let error = NSError(domain: "Failure Request", code: 0, userInfo: ["Message": "Erro na requisição"])
                `self`.delegate?.presenter(`self`, result: Result.failure(error))
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
    
}
