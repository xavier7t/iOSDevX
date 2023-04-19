//
//  ContentView-DemoWithAnimation20230418.swift
//  iOSDevX
//
//  Created by Xavier on 4/17/23.
//

import SwiftUI

struct ContentView_DemoWithAnimation20230418: View {
    var body: some View {
        NavigationView {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Basic", systemImage: "1.circle")
                    }
                ContentView2()
                    .tabItem {
                        Label("Transition", systemImage: "2.circle")
                    }
            }
            .navigationTitle("withAnimation")
        }
    }
    struct ContentView: View {
        @State private var scale: CGFloat = 1.0
        
        var body: some View {
            Button("Tap me to enlarge!") {
                withAnimation {
                    self.scale *= 1.5
                }
            }
            .scaleEffect(scale)
        }
    }

    struct ContentView2: View {
        @State private var showDetails = false
        
        var body: some View {
            VStack {
                Button((showDetails ? "Hide" : "Show") + " details") {
                    withAnimation {
                        self.showDetails.toggle()
                    }
                }
                if showDetails {
                    Text("Here are some details")
                        .transition(.opacity)
                }
            }
        }
    }
}

struct ContentView_DemoWithAnimation20230418_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ContentView_DemoWithAnimation20230418()
        }
    }
}
