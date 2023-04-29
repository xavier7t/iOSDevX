//
//  DemoEnvironmentObject20230428.swift
//  iOSDevX
//
//  Created by Xavier on 4/28/23.
//

import SwiftUI



struct DemoEnvironmentObject20230428 {
    class UserData: ObservableObject {
        @Published var username = "Guest"
    }
    //struct ContentView: View {
    //    @EnvironmentObject var userData: UserData
    //
    //    var body: some View {
    //        Text("Welcome, \(userData.username)!")
    //    }
    //}
    struct ContentView: View {
        @EnvironmentObject var userData: UserData
        
        var body: some View {
            VStack {
                Text("Welcome, \(userData.username)!")
                Button(action: {
                    userData.username = "John"
                }) {
                    Text("Update Username")
                }
            }
        }
    }

    struct MainView: View {
        var body: some View {
            ContentView().environmentObject(UserData())
        }
    }

    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
