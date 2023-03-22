//
//  ContentView-DemoPageView20230321.swift
//  iOSDevX
//
//  Created by Xavier on 3/21/23.
//

import SwiftUI

struct ContentView_DemoPageView20230321: View {
    var body: some View {
        TabView {
            tab1
                .tabItem {
                    Label("Tab 1", systemImage: "circle")
                }
            tab2
                .tabItem {
                    Label("Tab 2", systemImage: "circle")
                }
            tab3
                .tabItem {
                    Label("Tab 3", systemImage: "circle")
                }
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
    private var tab1: some View {
        ZStack {
            LinearGradient(colors: [.red, .orange], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Image(systemName: "swift")
                Text("Welcome to")
                    .foregroundColor(.black)
                Text("iOSDevX Page 1")
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.black)
        }
    }
    private var tab2: some View {
        ZStack {
            LinearGradient(colors: [.orange, .yellow], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Image(systemName: "swift")
                Text("Welcome to")
                    .foregroundColor(.black)
                Text("iOSDevX Page 2")
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.black)
        }
    }
    private var tab3: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .green], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Image(systemName: "swift")
                Text("Welcome to")
                    .foregroundColor(.black)
                Text("iOSDevX Page 3")
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.black)
        }
    }
}

struct ContentView_DemoPageView20230321_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoPageView20230321()
    }
}
