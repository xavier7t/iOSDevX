//
//  ContentView-DemoGroup20230302.swift
//  iOSDevX
//
//  Created by Xavier on 3/2/23.
//

import SwiftUI

struct ContentView_DemoGroup20230302: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Grouped")
                        Spacer()
                        Text("Ungrouped")
                    }
                    .bold()
                    .font(.title3)
                    Divider()
                    HStack {
                        groupedElements
                        Spacer()
                        ungroupedElements
                    }
                    Divider()
                    HStack {
                        groupedForModifier
                        Spacer()
                        ungroupedForModifier
                    }
                    Divider()
                }
            }
            .padding(.horizontal)
            .navigationTitle("GroupView")
        }
    }
}

struct ContentView_DemoGroup20230302_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoGroup20230302()
    }
}


//MARK: Using a group to avoid extra argument in call
extension ContentView_DemoGroup20230302 {
    private var ungroupedElements: some View {
        VStack {
            Text("Text1")
            Text("Text2")
            Text("Text3")
            Text("Text4")
            Text("Text5")
            Text("Text6")
            Text("Text7")
            Text("Text8")
            Text("Text9")
            Text("Text10")
            //Uncomment the line below to see the error message
            //Text("Text11")
        }
    }
    private var groupedElements: some View {
        VStack {
            Group {
                Text("Text1")
                Text("Text2")
                Text("Text3")
                Text("Text4")
                Text("Text5")
                Text("Text6")
            }
            Group {
                Text("Text7")
                Text("Text8")
                Text("Text9")
                Text("Text10")
                Text("Text11")
            }
        }
    }
}

//MARK: Using a group to create a conditional view
extension ContentView_DemoGroup20230302 {
    //Uncomment the property below to see the error message
//    private var ungroupedIfStatement: some View {
//        if true {
//            Text("I’m true")
//        }
//    }
    // Work around without a group
    private var ifStatementWithoutGroup: some View {
        if true {
            return Text("I’m true")
        } else {
            return Text("I’m false")
        }
    }
    //MARK: Using a group to apply a view modifier to multiple views
    private var groupedIfStatement: some View {
        Group {
            if true {
                Text("I’m true")
            } else {
                Text("I’m false")
            }
        }
        .padding()
    }

}


//MARK: Using a group to apply a view modifier to handle user interaction
extension ContentView_DemoGroup20230302 {
    private var ungroupedForModifier: some View {
        VStack {
            Text("This text is not tappable")
            Text("I want to be bold.")
                .bold()
                .font(.footnote)
                .onTapGesture {
                    print("Tapped1")
                }
            Text("I want to be bold.")
                .bold()
                .font(.footnote)
                .onTapGesture {
                    print("Tapped2")
                }
        }
    }
    
    private var groupedForModifier: some View {
        VStack {
            Text("This text is not tappable")
            Group {
                Text("I want to be bold.")
                Text("I want to be bold.")
            }
            .bold()
            .font(.footnote)
            .onTapGesture {
                print("Tapped")
            }
        }
    }
}
