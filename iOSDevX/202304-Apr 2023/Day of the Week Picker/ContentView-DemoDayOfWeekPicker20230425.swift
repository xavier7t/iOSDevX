//
//  ContentView-DemoDayOfWeekPicker20230425.swift
//  iOSDevX
//
//  Created by Xavier on 4/25/23.
//

import SwiftUI

struct ContentView_DemoDayOfWeekPicker20230425: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Single Day Picker")
                    .bold()
                    .font(.title3)
                DayPicker()
                Divider()
                Text("Multiple Days Picker")
                    .bold()
                    .font(.title3)
                DaysPicker()
            }
            .navigationTitle("Day of Week Picker")
        }
    }
    
    enum Day: String, CaseIterable {
        case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
    }
    struct DayPicker: View {
        @State private var selectedDay = Day.Monday

        var body: some View {
            Picker("Day", selection: $selectedDay) {
                ForEach(Day.allCases, id: \.self) {
                    Text($0.rawValue).tag($0)
                }
            }
        }
    }
    struct DaysPicker: View {
        @State private var selectedDays: [Day] = []
        var body: some View {
            HStack {
                ForEach(Day.allCases, id: \.self) { day in
                    Text(String(day.rawValue.first!))
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(selectedDays.contains(day) ? Color.cyan.cornerRadius(10) : Color.gray.cornerRadius(10))
                        .onTapGesture {
                            if selectedDays.contains(day) {
                                selectedDays.removeAll(where: {$0 == day})
                            } else {
                                selectedDays.append(day)
                            }
                        }
                }
            }
        }
    }

}

struct ContentView_DemoDayOfWeekPicker20230425_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoDayOfWeekPicker20230425()
    }
}
