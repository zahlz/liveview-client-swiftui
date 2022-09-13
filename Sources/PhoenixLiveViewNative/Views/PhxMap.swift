//
//  PhxMap.swift
//  PhoenixLiveViewNative
//
//  Created by moogle19 on 13/9/22.
//

import MapKit
import SwiftUI
import SwiftSoup

struct PhxMap: View {
  @State var coordinateRegion: MKCoordinateRegion
  
  init<R: CustomRegistry>(element: Element, context: LiveContext<R>) {
    guard element.hasAttr("region-latitude"), element.hasAttr("region-longitude") else {
      preconditionFailure("<map> must have region-latitude and region-longitude")
    }
    
    guard
      let latitude = Double(try! element.attr("region-latitude")),
      let longitude = Double(try! element.attr("region-longitude")) else {
      preconditionFailure("region-latitude and region-longitude must be float values")
    }
    
    _coordinateRegion = State(initialValue: MKCoordinateRegion(
      center: CLLocationCoordinate2D(
        latitude: latitude,
        longitude: longitude
      ),
      span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    )
  }
  
  public var body: some View {
    Map(coordinateRegion: $coordinateRegion)
      
  }
}
