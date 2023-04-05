//
//  ContentView-DemoMagnificationGesture20230404.swift
//  iOSDevX
//
//  Created by Xavier on 4/4/23.
//

import SwiftUI

struct ContentView_DemoMagnificationGesture20230404: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_DemoMagnificationGesture20230404_Previews: PreviewProvider {
    static let content = ContentView_DemoMagnificationGesture20230404.self
    static var previews: some View {
        NavigationStack {
                content.ZoomingView()
                content.LimitedZoomingView()
            .navigationTitle("Magnification Gesture")
        }
    }
}

//MARK: - Demo 1 - Mag Gesture
extension ContentView_DemoMagnificationGesture20230404 {
    struct ZoomingView: View {
        @State private var scale: CGFloat = 1.0
        
        var body: some View {
            Text("Pinch to Zoom")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding()
                .background(Color.blue.cornerRadius(10))
                .scaleEffect(scale)
                .gesture(MagnificationGesture()
                            .onChanged { scale in
                                self.scale = scale.magnitude
                            }
                )
        }
    }
}


//MARK: - Demo 2 - Limited Mag Gesture
extension ContentView_DemoMagnificationGesture20230404 {
    struct LimitedZoomingView: View {
        @State private var scale: CGFloat = 1.0
        
        var body: some View {
            Text("Pinch to Zoom")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding()
                .background(Color.blue.cornerRadius(10))
                .scaleEffect(scale, anchor: .center)
                .gesture(MagnificationGesture()
                            .onChanged { scale in
                                self.scale = min(max(scale.magnitude, 0.5), 2.0)
                            }
                )
        }
    }
}
