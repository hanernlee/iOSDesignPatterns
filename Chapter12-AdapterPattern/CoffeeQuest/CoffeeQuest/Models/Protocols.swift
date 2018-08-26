//
//  Protocols.swift
//  CoffeeQuest
//
//  Created by Christopher Lee on 26/8/18.
//  Copyright © 2018 Jay Strawn. All rights reserved.
//

import Foundation
import MapKit
import YelpAPI

protocol SearchResultsProtocol {
  func adaptSearchResultsFromYLP() -> SearchResults
}

protocol BusinessProtocol {
  func adaptBusinessFromYLP() -> Business
}

public struct SearchResults {
  var business: [Business]
  var total: UInt
}

public struct Business {
  var name: String
  var rating: Double
  var location: CLLocationCoordinate2D
}

extension YLPLocation {
  func getCoordinateFromYLP() -> CLLocationCoordinate2D {
    let coordinate = CLLocationCoordinate2DMake(self.coordinate!.latitude, self.coordinate!.longitude)
    return coordinate
  }
}

extension YLPBusiness: BusinessProtocol {
  func adaptBusinessFromYLP() -> Business {
    return Business(name: self.name, rating: self.rating, location: self.location.getCoordinateFromYLP())
  }
}

extension YLPSearch: SearchResultsProtocol {
  func adaptSearchResultsFromYLP() -> SearchResults {
    var businesses: [Business] = []
    
    for business in self.businesses {
      businesses.append(business.adaptBusinessFromYLP())
    }
    
    return SearchResults(business: businesses, total: self.total)
  }
}
