//
//  DemoTabView20250735.swift
//  iOSDevX
//
//  Created by Xavier on 7/25/25.
//

import SwiftUI

struct DemoTabView20250735 {
    struct ContentView: View {
        @State private var searchText: String = ""
        
        var body: some View {
            if #available(iOS 26, *) {
                mainView
            }
        }
        
        private var placeholderList: some View {
            List {
                ForEach(Array(0...10), id: \.self) { index in
                    Text("Row \(index)")
                        .foregroundStyle(.black)
                        .bold()
                        .padding(.vertical)
                        .listRowBackground(Color(hue: CGFloat(index) / CGFloat(10), saturation: 0.55, brightness: 0.9))
                }
            }
        }
        
        @available(iOS 18, *)
        var tabView: some View {
            TabView {
                Tab("Search", systemImage: "magnifyingglass", role: .search) {
                    NavigationStack {
                        placeholderList
                        .searchable(text: $searchText, prompt: "Looking for something?")
                        .navigationTitle("Search")
                    }
                }
                Tab("Home", systemImage: "house") {
                    NavigationStack {
                        placeholderList
                        .navigationTitle("Home")
                    }
                }
                Tab("Settings", systemImage: "gear") {
                    NavigationStack {
                        placeholderList
                        .navigationTitle("Settings")
                    }
                }
            }
            .tint(.teal)
        }
        
        @ViewBuilder
        var mainView: some View {
            if #available(iOS 26.0, *) {
                tabView
                    .tabViewBottomAccessory {
                        Button {
                            //
                        } label: {
                            HStack {
                                Image(systemName: "plus")
                                Text("Add a new record now")
                            }
                        }
                        .bold()
                        .tint(.primary)
                    }
            } else if #available(iOS 18, *) {
                tabView
            }
        }
    }
}

#Preview {
    DemoTabView20250735.ContentView()
        .preferredColorScheme(.dark)
}
