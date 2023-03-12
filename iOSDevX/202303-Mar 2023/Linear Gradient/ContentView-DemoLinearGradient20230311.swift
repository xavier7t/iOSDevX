//
//  ContentView-DemoLinearGradient20230311.swift
//  iOSDevX
//
//  Created by Xavier on 3/11/23.
//

import SwiftUI

struct ContentView_DemoLinearGradient20230311: View {
    
    var backgroundGradient = LinearGradient(colors: [.green, .cyan, .cyan, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
    var textGradient = LinearGradient(colors: [.cyan, .indigo, .red], startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundGradient.ignoresSafeArea()
                cardView
            }
        }
    }
    
    var cardView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 35)
                .foregroundColor(Color.white.opacity(0.4))
                .frame(width: 350, height: 230)
                .shadow(radius: 15)
            textGradient
            .mask(
                VStack {
                    Text("Gift Card X")
                        .font(.title)
                        .bold()
                    Text(100.formatted(.currency(code: "USD")))
                        .font(.system(size: 50, weight: .heavy))
                        .bold()
                }
                    .frame(width: 350, height: 230)
            )
            
        }
        .frame(width: 300, height: 300)
    }
}

struct ContentView_DemoLinearGradient20230311_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoLinearGradient20230311()
    }
}
