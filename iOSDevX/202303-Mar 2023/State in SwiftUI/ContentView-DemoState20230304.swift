//
//  ContentView-DemoState20230304.swift
//  iOSDevX
//
//  Created by Xavier on 3/4/23.
//

import SwiftUI

struct ContentView_DemoState20230304: View {
//    var myString: String = ""
    @State private var stateString1: String = "Hello, World! - 1"
    private var stateString2: State<String> = State(initialValue: "Hello, World! - 2")
    var body: some View {
        VStack {
//            Text(myString)
            Text(stateString1)
            HStack {
                Text("User input: ")
                TextField("Enter your username", text: stateString2.projectedValue)
                    .underline()
            }
            Text(stateString2.wrappedValue)
            Text(stateString2.projectedValue.wrappedValue)
        }
        .onAppear {
//            myString = "Show this in the contentview"
            stateString1 = "Content View on appear..."
            stateString2.wrappedValue = "Content View on appear..."
            print("Projected value: ", stateString2.projectedValue.wrappedValue)
            print("Wrapped value: ", stateString2.wrappedValue)
        }
    }
    
    //Uncomment the struct below to replicate the error
//    struct TestStruct {
//        var myString: String = ""
//        var someComputedProperty: String {
//            myString = "Hello world"
//            return ""
//        }
//    }
}

struct ContentView_DemoState20230304_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoState20230304()
    }
}
