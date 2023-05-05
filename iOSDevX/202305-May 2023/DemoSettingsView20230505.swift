//
//  DemoSettingsView20230505.swift
//  iOSDevX
//
//  Created by Xavier on 5/5/23.
//

import SwiftUI

struct DemoSettingsView20230505: View {
    var body: some View {
        SettingsView()
    }
    struct SettingsView: View {
        var body: some View {
            NavigationView {
                List {
                    Section(header: Text("GENERAL")) {
                        NavigationLink(destination: Text("Do Not Disturb")) {
                            HStack {
                                Image(systemName: "moon")
                                Text("Do Not Disturb")
                            }
                        }
                        NavigationLink(destination: Text("Display & Brightness")) {
                            HStack {
                                Image(systemName: "textformat.size")
                                Text("Display & Brightness")
                            }
                        }
                        NavigationLink(destination: Text("Sounds & Haptics")) {
                            HStack {
                                Image(systemName: "speaker.2")
                                Text("Sounds & Haptics")
                            }
                        }
                        NavigationLink(destination: Text("Screen Time")) {
                            HStack {
                                Image(systemName: "hourglass")
                                Text("Screen Time")
                            }
                        }
                    }
                    Section(header: Text("ACCOUNTS")) {
                        NavigationLink(destination: Text("iCloud")) {
                            HStack {
                                Image(systemName: "icloud")
                                Text("iCloud")
                            }
                        }
                        NavigationLink(destination: Text("Password & Security")) {
                            HStack {
                                Image(systemName: "lock")
                                Text("Password & Security")
                            }
                        }
                    }
                    Section(header: Text("ABOUT")) {
                        NavigationLink(destination: Text("General")) {
                            HStack {
                                Image(systemName: "info.circle")
                                Text("General")
                            }
                        }
                        NavigationLink(destination: Text("Software Update")) {
                            HStack {
                                Image(systemName: "arrow.up.right.circle")
                                Text("Software Update")
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Settings")
            }
        }
    }

}

struct DemoSettingsView20230505_Previews: PreviewProvider {
    static var previews: some View {
        DemoSettingsView20230505()
    }
}
