//
//  ContentView-DemoColorPicker20230213.swift
//  iOSDevX
//
//  Created by Xavier on 3/1/23.
//

import SwiftUI

struct ContentView_DemoColorPicker20230213: View {
    @State private var selectedColor: Color = .indigo
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(selectedColor)
            Text("Hello, world!")
                .foregroundColor(selectedColor)
            //SwiftUIStandardColorPicker
            ColorPicker(selection: $selectedColor) {
                Text("Change color here: ")
            }
            .padding(.horizontal, 50)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_DemoColorPicker20230213_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoColorPicker20230213()
    }
}
