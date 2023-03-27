//
//  ContentView-DemoDatePicker20230326.swift
//  iOSDevX
//
//  Created by Xavier on 3/26/23.
//

import SwiftUI

struct ContentView_DemoDatePicker20230326: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ContentView1()
                ContentView2()
                ContentView3()
                ContentView4()
            }
            .padding(.horizontal)
            .navigationTitle("Date Picker")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoDatePicker20230326()
    }
}

extension ContentView_DemoDatePicker20230326 {
    //MARK: - Basic Usage
    struct ContentView1: View {
        @State private var selectedDate = Date()
        
        var body: some View {
            VStack {
                DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                Text("Selected date: \(selectedDate.formatted(date: .abbreviated, time: .omitted))")
            }
        }
    }
    //MARK: - Date Range Configuration
    struct ContentView2: View {
        @State private var selectedDate = Date()
        
        var body: some View {
            VStack {
                DatePicker("Select a date", selection: $selectedDate, in: Date()...Date().addingTimeInterval(86400), displayedComponents: .date)
                Text("Selected date: \(selectedDate.formatted(date: .abbreviated, time: .omitted))")
            }
        }
    }
    //MARK: - Style Configuration
    struct ContentView3: View {
        @State private var selectedDate = Date()
        var body: some View {
            VStack {
                DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.compact)

                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.wheel)

                DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.graphical)
            }
        }
    }
    //MARK: - Locale Configuration
    struct ContentView4: View {
        @State private var selectedDate = Date()
        var body: some View {
            VStack {
                DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                    .environment(\.locale, Locale.init(identifier: "fr_FR"))
                DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                    .environment(\.locale, Locale.init(identifier: "ar"))
            }
        }
    }
}

