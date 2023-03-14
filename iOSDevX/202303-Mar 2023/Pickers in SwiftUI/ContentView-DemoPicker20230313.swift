//
//  ContentView-DemoPicker20230313.swift
//  iOSDevX
//
//  Created by Xavier on 3/13/23.
//

import SwiftUI

struct ContentView_DemoPicker20230313: View {
    @State private var pickedDirection: Direction = .north
    var body: some View {
        NavigationStack {
            List {
                picker
                picker.pickerStyle(.menu)
                picker.pickerStyle(.navigationLink)
                picker.pickerStyle(.segmented)
                picker.pickerStyle(.wheel)
                picker.pickerStyle(.inline)
            }
            .navigationTitle("Picker View")
        }
    }
    enum Direction: String, CaseIterable {
        case north = "North"
        case south = "South"
        case east = "East"
        case west = "West"
    }
    
    private var picker: some View {
        VStack {
            Picker("Select a direction", selection: $pickedDirection) {
                ForEach(Direction.allCases, id: \.self) { direction in
                    Text(direction.rawValue)
                }
            }
        }
    }
}

struct ContentView_DemoPicker20230313_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoPicker20230313()
    }
}
