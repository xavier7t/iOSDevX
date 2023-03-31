//
//  ContentView-DemoGaugeView20230331.swift
//  iOSDevX
//
//  Created by Xavier on 3/30/23.
//

import SwiftUI

struct ContentView_DemoGaugeView20230331: View {
    var body: some View {
        NavigationStack {
            VStack {
                ContentView1()
                Spacer()
                    .frame(height: 50)
                ContentView2()
                Spacer()
                    .frame(height: 50)
                ContentView3()
                Spacer()
                    .frame(height: 50)
                ContentView4()
            }
            .navigationTitle("Gauge")
        }
    }
}

struct ContentView_DemoGaugeView20230331_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoGaugeView20230331()
    }
}

extension ContentView_DemoGaugeView20230331 {
    
    //MARK: - Basic Usage
    struct ContentView1: View {
        @State private var currentValue = 0.5
        var body: some View {
            Gauge(value: currentValue) {
                Text(currentValue.formatted())
            }
            .frame(width: 150)
        }
    }
    //MARK: - Init with more details
    struct ContentView2: View {
        @State private var currentValue = 0.5
        var body: some View {
            Gauge(value: currentValue, in: 0...1, label: {
                Text("Current Value")
            }, currentValueLabel: {
                Text("Current: " + currentValue.formatted())
            }, minimumValueLabel: {
                Text("min: 0")
            }, maximumValueLabel: {
                Text("max: 1")
            })
            .frame(width: 350)
        }
    }
    //MARK: - Gauge Style
    struct ContentView3: View {
        @State private var currentValue = 0.5
        var body: some View {
            ContentView_DemoGaugeView20230331.ContentView1()
                .gaugeStyle(.accessoryCircular)
            .frame(width: 350)
        }
    }
    //MARK:  - Demo: Battery Level Gauge
    struct ContentView4: View {
        @State private var batteryLevel: Double = 60
        var gaugeColor: Color {
            switch batteryLevel {
            case 50...100: return .green
            case 21...49: return .orange
            default: return .red
            }
        }
        var body: some View {
            VStack {
                Gauge(value: batteryLevel, in: 0...100) {
                    Text(batteryLevel.formatted() + "%")
                        .foregroundColor(gaugeColor)
                }
                .gaugeStyle(.accessoryCircularCapacity)
                .tint(gaugeColor)
                HStack {
                    Button {
                        if batteryLevel > 1 {
                            batteryLevel -= 10
                        }
                    } label: {
                        Text("Decrease")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .frame(width: 70, height: 30, alignment: .center)
                            .background(Color.red.cornerRadius(10))
                        
                    }
                    Button {
                        if batteryLevel < 99 {
                            batteryLevel += 10
                        }
                    } label: {
                        Text("Increase")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .frame(width: 70, height: 30, alignment: .center)
                            .background(Color.green.cornerRadius(10))
                        
                    }
                }
            }
        }
    }
}
