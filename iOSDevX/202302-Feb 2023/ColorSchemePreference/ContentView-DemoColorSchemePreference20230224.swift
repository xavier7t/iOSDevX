//
//  ContentView-DemoColorSchemePreference20230224.swift
//  iOSDevX
//
//  Created by Xavier on 3/1/23.
//

import SwiftUI

struct ContentView_DemoColorSchemePreference20230224: View {
    @AppStorage("colorScheme") var selectedColorScheme: String = "system"
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Picker(selection: $selectedColorScheme, label: Text("Color Scheme")) {
                        Text("System").tag("system")
                        Text("Light").tag("light")
                        Text("Dark").tag("dark")
                    }
                    .pickerStyle(.segmented)
                    .preferredColorScheme(getPreferredColorScheme())
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    private func getPreferredColorScheme() -> ColorScheme? {
        switch selectedColorScheme {
        case "light":
            return .light
        case "dark":
            return .dark
        default:
            return nil
        }
    }
}

struct ContentView_DemoColorSchemePreference20230224_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoColorSchemePreference20230224()
    }
}
