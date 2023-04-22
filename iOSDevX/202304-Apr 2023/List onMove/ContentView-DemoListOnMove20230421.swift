//
//  ContentView-DemoListOnMove20230421.swift
//  iOSDevX
//
//  Created by Xavier on 4/21/23.
//

import SwiftUI

struct ContentView_DemoListOnMove20230421: View {
    var body: some View {
        ContentView()
    }
    struct ContentView: View {
        @State var colors = ["Red", "Green", "Blue", "Yellow", "Purple"]
        
        var body: some View {
            List {
                ForEach(colors, id: \.self) { color in
                    Text(color)
                }
                .onMove(perform: move)
            }
            .onAppear {
                UITableView.appearance().isEditing = true
            }
        }
        
        private func move(from source: IndexSet, to destination: Int) {
            colors.move(fromOffsets: source, toOffset: destination)
        }
    }
}

struct ContentView_DemoListOnMove20230421_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView_DemoListOnMove20230421()
                .navigationTitle("A List with onMove")
        }
    }
}


