//
//  ContentView-DemoCustomShape20230307.swift
//  iOSDevX
//
//  Created by Xavier on 3/7/23.
//

import SwiftUI

struct ContentView_DemoCustomShape20230307: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Text("A Triangle using addLine").bold()
                    Spacer()
                    triangle_addLine
                }
                Spacer()
                    .frame(height: 100)
                HStack {
                    Text("A Trapezoid using addLines").bold()
                    Spacer()
                    trapezoid_addLines
                }
                Spacer()
                    .frame(height: 100)
                HStack {
                    Text("A separated circle using addArc").bold()
                    Spacer()
                    arc_addArc
                }
                Spacer()
                    .frame(height: 150)
                HStack {
                    Text("A curve using addCurve").bold()
                    Spacer()
                    curve_addCurve
                }
            }
            .padding(.horizontal)
            .navigationTitle("Custom Shapes")
        }
    }
}

struct ContentView_DemoCustomShape20230307_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoCustomShape20230307()
    }
}

extension ContentView_DemoCustomShape20230307 {
    private var triangle_addLine: some View {
        Path { path in
            path.move(to: CGPoint(x: 150, y: 0))
            path.addLine(to: CGPoint(x: 10, y: 100))
            path.addLine(to: CGPoint(x: 150, y: 100))
//            path.addLine(to: CGPoint(x: 150, y: 100))
            path.closeSubpath() // path.addLine(to: CGPoint(x: 150, y: 0))
        }
        .stroke()
    }
    
    private var trapezoid_addLines: some View {
        Path { path in
            path.addLines([
                .init(x: 50, y: 0),
                .init(x: 150, y: 0),
                .init(x: 150, y: 100),
                .init(x: 0, y: 100)
            ])
        }
    }
    private var arc_addArc: some View {
        ZStack {
            Path { path in
                path.addArc(center: .init(x: 100, y: 50), radius: 50, startAngle: .init(degrees: 0), endAngle: .init(degrees: 90), clockwise: true)
            }
            .stroke(lineWidth: 5)
            .fill(LinearGradient(colors: [.indigo, .indigo, .indigo, .green, .yellow], startPoint: .topLeading, endPoint: .bottom))
            Path { path in
                path.addArc(center: .init(x: 110, y: 60), radius: 50, startAngle: .init(degrees: 0), endAngle: .init(degrees: 90), clockwise: false)
            }
            .stroke(style: .init(lineWidth: 4, dash: [5, 3], dashPhase: 10))
            .foregroundColor(.pink)
        }
    }
    private var curve_addCurve: some View {
        Path { path in
            path.move(to: .init(x: 50, y: 0))
            path.addCurve(to: .init(x: 200, y: 00), control1: .init(x: 125, y: -120), control2: .init(x: 125, y: 160))
        }
        .stroke(lineWidth: 8)
        .foregroundColor(.indigo)
    }
}
