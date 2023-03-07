//
//  ContentView-DemoShapes20230306.swift
//  iOSDevX
//
//  Created by Xavier on 3/6/23.
//

import SwiftUI

struct ContentView_DemoShapes20230306: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Text("Types of Shapes")
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                VStack {
                    
                    //MARK: Rectangular shapes
                    HStack {
                        Text("Rectangle" + ":").bold()
                        Spacer()
                        Rectangle()
                            .frame(width: 150, height: 50)
                    }
                    HStack {
                        Text("Rounded Rectangle" + ":").bold()
                        Spacer()
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 150, height: 50)
                    }
                    //MARK: Circular shapes
                    HStack {
                        Text("Circle" + ":").bold()
                        Spacer()
                        Circle()
                            .frame(width: 50, height: 50)
                    }
                    HStack {
                        Text("Ellipse" + ":").bold()
                        Spacer()
                        Ellipse()
                            .frame(width: 150, height: 50)
                    }
                    HStack {
                        Text("Capsule" + ":").bold()
                        Spacer()
                        Capsule()
                            .frame(width: 150, height: 50)
                    }
                    HStack {
                        Text("Shape Modifiers")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                }
                //MARK: Demonstration of modifiers
                VStack {
                    HStack {
                        Text("Unmodified Stroke").bold()
                        Spacer()
                        Capsule()
                            .stroke()
                            .frame(width: 120, height: 40)
                    }
                    HStack {
                        Text("Stroke with style").bold()
                        Spacer()
                        Capsule()
                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                            .frame(width: 120, height: 40)
                    }
                    HStack {
                        Text("Fg Color + Stroke overlay").bold()
                        Spacer()
                        Capsule()
                            .frame(width: 120, height: 40)
                            .foregroundColor(.accentColor)
                            .overlay {
                                Capsule().stroke(lineWidth: 2)
                            }
                    }
                    HStack {
                        Text("Filled with color gradient").bold()
                        Spacer()
                        Capsule()
                            .fill(LinearGradient(colors: [.indigo, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 120, height: 40)
                    }
                }
            }
            .navigationTitle("SwiftUI Shapes")
        .padding(15)
        }
    }
}

struct ContentView_DemoShapes20230306_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoShapes20230306()
    }
}
