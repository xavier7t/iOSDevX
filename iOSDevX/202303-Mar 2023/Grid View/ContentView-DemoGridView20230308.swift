//
//  ContentView-DemoGridView20230308.swift
//  iOSDevX
//
//  Created by Xavier on 3/8/23.
//

import SwiftUI

struct ContentView_DemoGridView20230308: View {
    private var fixedGridItems: [GridItem] = [
        .init(.fixed(50)),
        .init(.fixed(150)),
        .init(.fixed(200))
    ]
    private var flexibleGridItems: [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    private var adaptiveGridItems: [GridItem] = [
        .init(.adaptive(minimum: 100, maximum: 120)),
        .init(.adaptive(minimum: 150)),
        .init(.adaptive(minimum: 120))
    ]
    private var homeGridItems: [GridItem] = [
        .init(.flexible())
    ]
    var body: some View {
            TabView {
                homeView
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                fixedGridItemsView
                    .tabItem {
                        Label("Fixed", systemImage: "photo.artframe")
                    }
                flexibleGridItemsView
                    .tabItem {
                        Label("Flexible", systemImage: "figure.flexibility")
                    }
                adaptiveGridItemsView
                    .tabItem {
                        Label("Adaptive", systemImage: "poweroutlet.type.a")
                    }

            }
    }
}

struct ContentView_DemoGridView20230308_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoGridView20230308()
    }
}

extension ContentView_DemoGridView20230308 {

    private var flexibleGridItemsView: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: flexibleGridItems) {
                    ForEach(0...9, id: \.self) { item in
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke()
                                .frame(width: 100, height: 150)
                                .foregroundColor(.accentColor)
                            Text("\(item)")
                        }
                    }
                }
            }
            .navigationTitle("Flexible")
        }
    }
    
    private var fixedGridItemsView: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: fixedGridItems) {
                    ForEach(0...9, id: \.self) { item in
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke()
                                .frame(width: 100, height: 50)
                                .foregroundColor(.accentColor)
                            Text("\(item)")
                        }
                    }
                }
            }
            .navigationTitle("Fixed")
        }

    }
    
    private var adaptiveGridItemsView: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: adaptiveGridItems) {
                    ForEach(0...9, id: \.self) { item in
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.accentColor)
                            Text("\(item)")
                        }
                    }
                }
            }
            .navigationTitle("Adaptive")
        }
    }
    private var homeView: some View {
        NavigationStack {
            ScrollView {
                HStack(alignment: .top) {
                    LazyVGrid(columns: homeGridItems) {
                        imageList
                    }
                    LazyVGrid(columns: homeGridItems) {
                        imageList
                    }
                }
            }
            .navigationTitle("Grid View")
        }
    }
    
    private var imageList: some View {
        ForEach(0...49, id: \.self) { _ in
            Image("demo")
                .resizable()
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .frame(width: 180, height: CGFloat.random(in: 180...300), alignment: .center)
        }
    }
}
