//
//  ContentView-DemoTernaryOperator20230324.swift
//  iOSDevX
//
//  Created by Xavier on 3/24/23.
//

import SwiftUI

struct ContentView_DemoTernaryOperator20230324: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                TitleView(text: "Case 1 - Conditional Rendering")
                ContentView1()
                TitleView(text: "Case 2 - Toggling Boolean Value")
                ContentView2()
                TitleView(text: "Case 3 - Modifying View Properties")
                ContentView3()
                TitleView(text: "Case 4 - Setting View Layouts")
                ContentView4(isVertical: true)
                ContentView4(isVertical: false)
            }
            .navigationTitle("Ternary operator")
        }
    }
}

struct ContentView_DemoTernaryOperator20230324_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoTernaryOperator20230324()
    }
}

extension ContentView_DemoTernaryOperator20230324 {
    //MARK: - Conditional Rendering
    struct ContentView1: View {
        @State var isLogin = true
        
        var body: some View {
            if isLogin {
                Text("Welcome back!")
            } else {
                Text("Please log in.")
            }
            
            // Using ternary operator
            isLogin ? Text("Welcome back!") : Text("Please log in.")
        }
    }
    
    //MARK: - Toggling Boolean Value
    struct ContentView2: View {
        @State var isOn = false
        
        var body: some View {
            Button(action: {
                isOn.toggle()
            }) {
                Text(isOn ? "ON" : "OFF")
            }
            .foregroundColor(.white)
            .bold()
            .frame(width: 150, height: 40)
            .background(Color.indigo.cornerRadius(5))
        }
    }
    
    //MARK: - Modifying View Properties
    struct ContentView3: View {
        @State var isHighlighted = false
        
        var body: some View {
            Text("Tap me to highlight.")
                .bold()
                .foregroundColor(isHighlighted ? .red : .black)
                .onTapGesture {
                    isHighlighted.toggle()
                }
        }
    }
    //MARK: - Setting View Layouts
    struct ContentView4: View {
        var isVertical: Bool
        
        var body: some View {
            VStack {
                if isVertical {
                    vertical
                } else {
                    horizontal
                }
                
                // Using ternary operator
                isVertical ? AnyView(vertical) : AnyView(horizontal)
            }
        }
        var horizontal: some View {
            HStack {
                Text("Horizontal Stack")
                Text("Horizontal Stack")
            }
        }
        var vertical: some View {
            VStack {
                Text("Vertical Stack")
                Text("Vertical Stack")
            }
        }
    }
}

//MARK: - Title Formatting
extension ContentView_DemoTernaryOperator20230324 {
    struct TitleView: View {
        var text: String
        var body: some View {
            VStack {
                Divider()
                Text(text)
                    .bold()
                    .font(.title2)
            }
        }
    }
}


