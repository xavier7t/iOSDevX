//
//  ContentView-DemoRegex20230424.swift
//  iOSDevX
//
//  Created by Xavier on 4/24/23.
//

import SwiftUI
import Foundation

struct ContentView_DemoRegex20230424: View {
    @State private var email: String = ""
    @State private var isEmailValid: Bool = false

    var body: some View {
        VStack {
            TextField("Enter email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Text("Email is \(isEmailValid ? "valid" : "invalid")")
                .foregroundColor(isEmailValid ? .green : .red)
                .padding()

//            Button("Validate email") {
//                isEmailValid = isValidEmail(email)
//            }
//            .padding()
                .onChange(of: email) { newValue in
                    isEmailValid = isValidEmail(newValue)
                }
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
        return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.utf16.count)) != nil
    }
}
struct ContentView_DemoRegex20230424_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView_DemoRegex20230424()
                .navigationTitle("Email Validator")
        }
    }
}

//MARK: - Other examples
extension ContentView_DemoRegex20230424 {
    func maskAPhoneNumber(_ phoneNumber: String) -> String {
        let regex = try! NSRegularExpression(pattern: "^\\d{3}\\d{3}\\d{4}$", options: [])
        return regex.stringByReplacingMatches(in: phoneNumber, options: [], range: NSRange(location: 0, length: phoneNumber.utf16.count), withTemplate: "***-***-$3")
    }
    func extractHashtag(_ string: String) -> [String] {
        let regex = try! NSRegularExpression(pattern: "#\\w+", options: [])
        let matches = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count))
        return matches.map { match in
            (string as NSString).substring(with: match.range)
        }
    }
    func replace(_ old: String, with new: String, in string: String) -> String {
        let regex = try! NSRegularExpression(pattern: "\\b\(old)\\b", options: [.caseInsensitive])
        return regex.stringByReplacingMatches(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count), withTemplate: new)
    }
    func isValidPassword(_ password: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d@$!%*?&]{8,}$", options: [])
        return regex.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.utf16.count)) != nil
    }
}
