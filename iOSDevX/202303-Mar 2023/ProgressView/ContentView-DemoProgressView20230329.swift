//
//  ContentView-DemoProgressView20230329.swift
//  iOSDevX
//
//  Created by Xavier on 3/29/23.
//

import SwiftUI

struct ContentView_DemoProgressView20230329: View {
    var body: some View {
        NavigationStack {
            VStack {
                ContentView1()
                Spacer()
                ContentView2()
                Spacer()
                ContentView3()
            }
            .frame(height: 400)
            .navigationTitle("Progress View")
        }
    }
}

struct ContentView_DemoProgressView20230329_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoProgressView20230329()
    }
}

struct ContentView1: View {
    @State private var progressValue = 0.5
    
    var body: some View {
        VStack {
            ProgressView(value: progressValue)
            Button("Increase Progress") {
                progressValue += 0.1
            }
        }
    }
}

struct ContentView2: View {
    @State private var progressValue = 0.5
    
    var body: some View {
        VStack {
            ProgressView(value: progressValue)
                .progressViewStyle(CircularProgressViewStyle(tint: .red))
                .accentColor(.blue)
                .padding(20)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(20)
            Button("Increase Progress") {
                progressValue += 0.1
            }
        }
    }
}

struct ContentView3: View {
    @State private var progressValue = 0.0
    
    var body: some View {
        VStack {
            if progressValue < 1.0 {
                ProgressView(value: progressValue, total: 1)
                    .progressViewStyle(LinearProgressViewStyle())
            } else {
                Text("Task completed.")
            }
            Button("Increase Progress") {
                withAnimation {
                    progressValue += 0.1
                }
            }
        }
        .onChange(of: progressValue) { newValue in
            if newValue >= 1.0 {
                print("Task Completed.")
            }
        }
    }
}
