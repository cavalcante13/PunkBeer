//
//  PunkRestableServiceTests.swift
//  Punk
//
//  Created by Diego Cavalcante on 29/06/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import XCTest
@testable import Punk

class PunkRestableServiceTests: XCTestCase {
    

    func testLoadBeers() {
        let expectation = self.expectation(description: "Expected load beers from service")
        
        let service : RestableService<Beer> = RestableService<Beer>(path: "https://api.punkapi.com/v2/beers?page=1&per_page=40")
        service.get(parse: Beer.init) { data in
            expectation.fulfill()
            
            XCTAssertNil(data as? Error)
            XCTAssert(data is Beer)
            
            if let b = data as? Beer {
                XCTAssert(b.beers.count != 0)
                
                let beer = b.beers.first
                XCTAssertEqual(beer?.id, 1)
                XCTAssertEqual(beer?.name, "Buzz")
                XCTAssertEqual(beer?.tagline, "A Real Bitter Experience.")
                XCTAssertEqual(beer?.abv, 4.5)
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }

    
}
