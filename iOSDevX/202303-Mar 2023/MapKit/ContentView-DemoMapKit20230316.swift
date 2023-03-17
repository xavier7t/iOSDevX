//
//  ContentView-DemoMapKit20230316.swift
//  iOSDevX
//
//  Created by Xavier on 3/16/23.
//

import SwiftUI
import MapKit

struct ContentView_DemoMapKit20230316: View {
    @State private var region: MKCoordinateRegion = .init(
        center: .init(latitude: 37.331432, longitude: -122.030289),
        span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea()
    }
}

struct ContentView_DemoMapKit20230316_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoMapKit20230316()
    }
}
