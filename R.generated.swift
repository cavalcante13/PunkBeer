//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 0 files.
  struct file {
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `icBeerPlaceholder`.
    static let icBeerPlaceholder = Rswift.ImageResource(bundle: R.hostingBundle, name: "icBeerPlaceholder")
    
    /// `UIImage(named: "icBeerPlaceholder", bundle: ..., traitCollection: ...)`
    static func icBeerPlaceholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icBeerPlaceholder, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 3 nibs.
  struct nib {
    /// Nib `BeerCollectionViewCell`.
    static let beerCollectionViewCell = _R.nib._BeerCollectionViewCell()
    /// Nib `BeerViewController`.
    static let beerViewController = _R.nib._BeerViewController()
    /// Nib `DetailBeerViewController`.
    static let detailBeerViewController = _R.nib._DetailBeerViewController()
    
    /// `UINib(name: "BeerCollectionViewCell", in: bundle)`
    static func beerCollectionViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.beerCollectionViewCell)
    }
    
    /// `UINib(name: "BeerViewController", in: bundle)`
    static func beerViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.beerViewController)
    }
    
    /// `UINib(name: "DetailBeerViewController", in: bundle)`
    static func detailBeerViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.detailBeerViewController)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `BeerCollectionViewCell`.
    static let beerCollectionViewCell: Rswift.ReuseIdentifier<BeerCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "BeerCollectionViewCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 2 localization tables.
  struct string {
    /// This `R.string.beer` struct is generated, and contains static references to 1 localization keys.
    struct beer {
      /// Value: Cervejas
      static let cervejas = Rswift.StringResource(key: "Cervejas", tableName: "Beer", bundle: R.hostingBundle, locales: [], comment: nil)
      
      /// Value: Cervejas
      static func cervejas(_: Void = ()) -> String {
        return NSLocalizedString("Cervejas", tableName: "Beer", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    /// This `R.string.endPoint` struct is generated, and contains static references to 1 localization keys.
    struct endPoint {
      /// Value: https://api.punkapi.com/v2/beers?page=%d&per_page=40
      static let httpsApiPunkapiComV2BeersPageDPer_page40 = Rswift.StringResource(key: "https://api.punkapi.com/v2/beers?page=%d&per_page=40", tableName: "EndPoint", bundle: R.hostingBundle, locales: [], comment: nil)
      
      /// Value: https://api.punkapi.com/v2/beers?page=%d&per_page=40
      static func httpsApiPunkapiComV2BeersPageDPer_page40(_ value1: Int) -> String {
        return String(format: NSLocalizedString("https://api.punkapi.com/v2/beers?page=%d&per_page=40", tableName: "EndPoint", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try nib.validate()
  }
  
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _DetailBeerViewController.validate()
    }
    
    struct _BeerCollectionViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = BeerCollectionViewCell
      
      let bundle = R.hostingBundle
      let identifier = "BeerCollectionViewCell"
      let name = "BeerCollectionViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> BeerCollectionViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? BeerCollectionViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _BeerViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "BeerViewController"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _DetailBeerViewController: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "DetailBeerViewController"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "icBeerPlaceholder", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icBeerPlaceholder' is used in nib 'DetailBeerViewController', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard {
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
