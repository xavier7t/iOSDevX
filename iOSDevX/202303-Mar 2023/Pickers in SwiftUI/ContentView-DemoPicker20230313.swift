//
//  ContentView-DemoPicker20230313.swift
//  iOSDevX
//
//  Created by Xavier on 3/13/23.
//

import SwiftUI

struct ContentView_DemoPicker20230313: View {
    
    @State private var pickedDirection: Direction = .north
    enum Direction: String, CaseIterable {
        case north = "North"
        case south = "South"
        case east = "East"
        case west = "West"
    }
    var picker: some View {
        Picker("Select a direction", selection: $pickedDirection) {
            ForEach(Direction.allCases, id: \.self) { direction in
                Text(direction.rawValue)
            }
        }
    }
    var body: some View {
        NavigationStack {
            List {
                picker
                picker.pickerStyle(.menu)
                picker
                    .pickerStyle(.segmented)
                picker
                    .pickerStyle(.wheel)
                picker
                    .pickerStyle(.inline)
            }
            .navigationTitle("SwiftUI Pickers")
        }
    }
}

struct ContentView_DemoPicker20230313_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoPicker20230313()
    }
}
