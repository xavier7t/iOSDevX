//
//  ContentView-DemoAlert20230328.swift
//  iOSDevX
//
//  Created by Xavier on 3/28/23.
//

import SwiftUI

struct ContentView_DemoAlert20230328: View {
    var body: some View {
        NavigationStack {
            VStack {
                ContentView1()
                Divider()
                ContentView2()
            }
            .navigationTitle("Alert")
        }
    }
}

struct ContentView_DemoAlert20230328_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoAlert20230328()
    }
}
extension ContentView_DemoAlert20230328 {
    //MARK: - Creating an alert
    struct ContentView1: View {
        @State private var showingAlert = false

        var body: some View {
            Button("Show Alert") {
                self.showingAlert = true
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Important Message"),
                      message: Text("This is a test message."),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
    //MARK: - Mutliple buttons in an alert
    struct ContentView2: View {
        @State private var showingAlert = false

        var body: some View {
            Button("Show Alert") {
                self.showingAlert = true
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Important Message"),
                      message: Text("Do you want to delete this item?"),
                      primaryButton: .destructive(Text("Delete"), action: {
                          // Perform delete action here
                      }),
                      secondaryButton: .cancel(Text("Cancel")))
            }
        }
    }
}
