//
//  ContentView-DemoGeometryReader20230317.swift
//  iOSDevX
//
//  Created by Xavier on 3/17/23.
//

import SwiftUI


struct ContentView_DemoGeometryReader20230317: View {
    var body: some View {
        VStack {
            //Comment or uncomment the lines below one by one to see the updates in the preview
            demo1
//            demo2
//            demo3
        }
    }
}

extension ContentView_DemoGeometryReader20230317 {
    //MARK: - Basic Usage
    private var demo1: some View {
        GeometryReader { proxy in
            Text("Width: \(proxy.size.width), Height: \(proxy.size.height)")
        }
    }
    //MARK: - Positioning Child Views
    private var demo2: some View {
        VStack {
            GeometryReader { proxy in
                VStack {
                    Text("Parent Width: \(proxy.size.width)")
                    HStack(spacing: 0) {
                        Text("Left")
                        Spacer()
                        Text("Right")
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
    //MARK: - Sizing Child Views Based on Parent Size
    private var demo3: some View {
        HStack {
            GeometryReader { proxy in
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(.cyan)
                    .frame(width: proxy.size.width / 2, height: proxy.size.width / 2)
            }
        }
        .frame(width: 100)
    }
}



struct ContentView_DemoGeometryReader20230317_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoGeometryReader20230317()
    }
}
