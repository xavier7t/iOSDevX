//
//  ContentView-DemoMapWithPin2023.swift
//  iOSDevX
//
//  Created by Xavier on 3/16/23.
//

import SwiftUI
import MapKit

struct ContentView_DemoMapWithPin2023: View {
    struct Location: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
    let locations = [
        Location(coordinate: CLLocationCoordinate2D(latitude: 37.331432, longitude: -122.030289))
    ]
    
    @State private var region: MKCoordinateRegion
    init() {
        region = .init(center: locations[0].coordinate, span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                Image(systemName: "mappin")
                    .resizable()
                    .frame(width: 15, height: 39, alignment: .center)
                    .foregroundColor(.red)
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_DemoMapWithPin2023_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoMapWithPin2023()
    }
}
