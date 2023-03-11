//
//  iOSDevXApp.swift
//  iOSDevX
//
//  Created by Xavier on 2/26/23.
//

import SwiftUI

@main
struct iOSDevXApp: App {
    var body: some Scene {
        WindowGroup {
            TestView()
        }
    }
}

var welcome: some View {
    ZStack {
        Color.indigo.opacity(0.8).ignoresSafeArea()
        VStack(alignment: .center) {
            Image(systemName: "swift")
                .resizable()
                .frame(width: 70, height: 70)
            Text("Welcome to iOSDevX!")
                .font(.largeTitle)
                .bold()
            Spacer()
                .frame(height: 50)
            Text("Please browse the project contents with").bold()
            Text("SwiftUI Previews").bold()
        }
    }
}
