//
//  ContentView-DemoDragGesture20230403.swift
//  iOSDevX
//
//  Created by Xavier on 4/3/23.
//

import SwiftUI

struct ContentView_DemoDragGesture20230403_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView_DemoDragGesture20230403()
                .navigationTitle("Drag Gesture")
        }
    }
}
struct ContentView_DemoDragGesture20230403: View {
    @State private var position = CGPoint(x: 100, y: 100)
    
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .offset(x: position.x, y: position.y)
            .gesture(
                DragGesture()
//                    .onEnded { gesture in
//                        position = gesture.location
//                    }
                    .onChanged { gesture in
                        position = gesture.location
                    }
            )
    }
}
