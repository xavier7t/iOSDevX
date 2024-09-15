//
//
// DemoRadialPattern20240914.swift
// iOSDevX
//
// Created by Xavier on 9/14/24.
//

import SwiftUI

struct DemoRadialPattern20240914 {
    struct ContentView: View {
        var body: some View {
            LinearGradient(colors: [
                .red, .orange, .yellow, .green, .blue, .purple
            ], startPoint: .leading, endPoint: .trailing)
            .mask(RadialPattern())
        }
    }

    struct RadialPattern: View {
        private let size: CGFloat = 250
        var body: some View {
            ZStack {
                Circle()
                    .fill(Color.clear)
                Dots(count: 20, dotSize: size / 10, xOffset: size / 2)
                Dots(count: 20, dotSize: size / 15, xOffset: size / 2.4)
                    .rotationEffect(.degrees(25))
                Dots(count: 20, dotSize: size / 20, xOffset: size / 2.9)
                Dots(count: 20, dotSize: size / 15, xOffset: size / 1.7)
                    .rotationEffect(.degrees(25))
                Dots(count: 20, dotSize: size / 20, xOffset: size / 1.6)
            }
        }

        struct Dots: View {
            let count: Int
            let dotSize: CGFloat
            let xOffset: CGFloat

            var body: some View {
                ZStack {
                    ForEach(0..<count, id: \.self) {
                        dot.rotationEffect(.degrees(Double($0 * 365 / count)))
                    }
                }
            }

            var dot: some View {
                Group {
                    Circle()
                        .frame(width: dotSize, height: dotSize)
                        .hidden()
                    Circle()
                        .frame(width: dotSize, height: dotSize)
                        .offset(x: xOffset)
                }
            }
        }
    }
}

#Preview {
    DemoRadialPattern20240914.ContentView()
}
