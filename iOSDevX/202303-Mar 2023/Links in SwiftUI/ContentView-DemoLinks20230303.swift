//
//  ContentView-DemoLinks20230303.swift
//  iOSDevX
//
//  Created by Xavier on 3/3/23.
//

import SwiftUI

struct ContentView_DemoLinks20230303: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Character Details")
                        .font(.title)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    Text("Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                    
                    //MARK: Link
                    Link("More information available on our website.",
                          destination: URL(string: "https://xavier7t.com")!)
                    .font(.footnote)
                    .bold()
                }
                .font(.caption)
                .padding()

                Divider()
                VStack(alignment: .leading, spacing: 15) {
                    Text("Inivite your friends")
                        .font(.title)
                    Text("Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    //MARK: Link
                    ShareLink(item: URL(string: "https://xavier7t.com")!) {
                        Label("Send the invitation", systemImage: "square.and.arrow.up")
                            .labelStyle(.titleAndIcon)
                            .font(.footnote)
                            .bold()
                    }
                }
                .font(.caption)
                .padding()
            }
            .navigationTitle("Links in SwiftUI")
        }
    }
}

struct ContentView_DemoLinks20230303_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoLinks20230303()
    }
}
