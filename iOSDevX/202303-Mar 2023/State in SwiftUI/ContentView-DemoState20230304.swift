//
//  ContentView-DemoState20230304.swift
//  iOSDevX
//
//  Created by Xavier on 3/4/23.
//

import SwiftUI

struct ContentView_DemoState20230304: View {
    //var myString: String = ""
    @State private var stateString1: String = "Hello, World! - 1"
    private var stateString2: State<String> = State(initialValue: "Hello, World! - 2")
    var body: some View {
        VStack {
            //Text(myString)
            Text(stateString1)
            Text(stateString2.wrappedValue)
            Text(stateString2.projectedValue.wrappedValue)
        }
        .onAppear {
            //myString = "Show this in the contentview"
            stateString1 = "Content View on appear..."
            stateString2.wrappedValue = "Content View on appear..."
            print("Projected value: ", stateString2.projectedValue)
            print("Wrapped value: ", stateString2.wrappedValue)
        }
    }
}

struct ContentView_DemoState20230304_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoState20230304()
    }
}
