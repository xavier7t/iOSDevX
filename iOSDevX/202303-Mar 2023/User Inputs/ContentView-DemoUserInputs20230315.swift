//
//  ContentView-DemoUserInputs20230315.swift
//  iOSDevX
//
//  Created by Xavier on 3/15/23.
//

import SwiftUI

struct ContentView_DemoUserInputs20230315: View {
    @State private var usernameInput: String = ""
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    @State private var noteInput: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("Username", text: $usernameInput)
                    .textFieldStyle(.roundedBorder)
                    .submitLabel(.next)
                    .frame(minHeight: 50)
                TextField("Email", text: $emailInput)
                    .keyboardType(.emailAddress)
                    .submitLabel(.next)
                    .textFieldStyle(.roundedBorder)
                    .frame(minHeight: 50)
                    .onSubmit {
                        // validation code goes here
                    }
                SecureField("Password", text: $passwordInput)
                    .textFieldStyle(.roundedBorder)
                    .submitLabel(.continue)
                    .onSubmit {
                        // validation code goes here
                    }
                HStack {
                    Text("Notes" + ":")
                    Spacer()
                }
                Divider()
                TextEditor(text: $noteInput)
                    .submitLabel(.done)
                    
            }
            .padding(.horizontal, 15)
            .navigationTitle("User Inputs")
        }
    }
}

struct ContentView_DemoUserInputs20230315_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoUserInputs20230315()
    }
}
