//
//  ContentView-Demo3DButton20230405.swift
//  iOSDevX
//
//  Created by Xavier on 4/5/23.
//

import SwiftUI

struct ContentView_Demo3DButton20230405: View {
    var body: some View {
        NavigationView {
            VStack {
                
                ThreeDButton(text: "Sign In", colors: [.indigo.opacity(0.5), .indigo], width: 210, height: 40, cornerRadius: 15) {
                    // perform registration action
                }
                .padding()
                ThreeDButton(text: "Register", colors: [.green, .blue], width: 150, height: 50, cornerRadius: 10) {
                    // perform registration action
                }
                .padding()
            }
            .navigationTitle("3D Buttons")
        }
    }
    struct ThreeDButton: View {
        var text: String
        var colors: [Color] = [.primary, .secondary]
        var width: CGFloat = .infinity
        var height: CGFloat = 50
        var cornerRadius: CGFloat = 15
        var action: () -> Void
        var body: some View {
            Button(action: action) {
                Text(text)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
    //                .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(width: width, height: height)
                    .background(
                        LinearGradient(
                            gradient: Gradient(
                                //colors: [color.opacity(0.4), color.opacity(0.7), color]
                                colors: colors
                            ),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
    //                .cornerRadius(15)
                    .cornerRadius(cornerRadius)
                    .shadow(color: .gray, radius: 3, x: 2, y: 2)
            }
        }
    }

}

struct ContentView_Demo3DButton20230405_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_Demo3DButton20230405()
    }
}

