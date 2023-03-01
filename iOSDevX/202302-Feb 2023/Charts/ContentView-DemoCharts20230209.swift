//
//  ContentView-DemoCharts20230209.swift
//  iOSDevX
//
//  Created by Xavier on 2/28/23.
//

import SwiftUI
import Charts

struct ContentView_DemoCharts20230209: View {
    //Model
    struct SalesRecord: Identifiable {
        let id = UUID()
        let office: String
        let salesVolume: Int
    }

    //Data
    let salesRecords: [SalesRecord] = [
        .init(office: "New York", salesVolume: 3000),
        .init(office: "San Fran", salesVolume: 2750),
        .init(office: "California", salesVolume: 4020),
        .init(office: "Denver", salesVolume: 930),
        .init(office: "Kansas", salesVolume: 2100)
    ]
    @State private var showAnnotation: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                Text("Bar Chart & Line Chart")
                    .bold()
                    .foregroundColor(.secondary.opacity(0.3))
                Chart {
                    ForEach(salesRecords) { record in
                        BarMark(
                            x: .value("Office Location", record.office),
                            y: .value("Sales Volume", record.salesVolume)
                        )
                        .annotation(position: .top, alignment: .top, spacing: 5, content: {
                            Text("\(record.salesVolume)")
                                .font(.footnote)
                                .foregroundColor(showAnnotation ? .secondary : .clear)
                        })
                        .foregroundStyle(.indigo)
                        .opacity(0.5)
                        //-------New lines: line mark in the same Chart element
                        LineMark(
                            x: .value("Office Location", record.office),
                            y: .value("Sales Volume", record.salesVolume)
                        )
                        .foregroundStyle(.red)
                    }
                }
                .onTapGesture {
                    self.showAnnotation.toggle()
                }
                Text("Monthly Sales by Office Location")
                    .font(.footnote)
                    .bold()
                
                Spacer()
                
                
                Text("Area Chart & Point Chart")
                    .bold()
                    .foregroundColor(.secondary.opacity(0.3))
                Chart {
                    ForEach(salesRecords) { record in
                        AreaMark(
                            x: .value("Office Location", record.office),
                            y: .value("Sales Volume", record.salesVolume)
                        )
                        .foregroundStyle(.linearGradient(colors: [.cyan, .cyan.opacity(0.2)], startPoint: .top, endPoint: .bottom))
                        PointMark(
                            x: .value("Office Location", record.office),
                            y: .value("Sales Volume", record.salesVolume)
                        )
                        .foregroundStyle(.pink.opacity(0.7))
                    }
                }
                Text("Monthly Sales by Office Location")
                    .font(.footnote)
                    .bold()
            }
            .padding()
            .navigationTitle("Sales Report")
        }
    }
}

struct ContentView_DemoCharts20230209_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoCharts20230209()
    }
}
