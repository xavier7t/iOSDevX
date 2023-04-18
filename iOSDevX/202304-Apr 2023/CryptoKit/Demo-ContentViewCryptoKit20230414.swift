//
//  Demo-ContentViewCryptoKit20230414.swift
//  iOSDevX
//
//  Created by Xavier on 4/14/23.
//

import SwiftUI
import CryptoKit

struct Demo_ContentViewCryptoKit20230414: View {
    var body: some View {
        VStack {
            ContentViewEnhanced()
        }
    }
}
struct Demo_ContentViewCryptoKit20230414_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Demo_ContentViewCryptoKit20230414()
                .navigationTitle("Encryptor")
        }
    }
}

func encryptPassword(password: String) -> String {
    let salt = "mysalt"
    let saltedPassword = password + salt
    
    guard let saltedPasswordData = saltedPassword.data(using: .utf8) else {
        return ""
    }
    
    let hashedPassword = SHA256.hash(data: saltedPasswordData)
    let hashedPasswordString = hashedPassword.compactMap { String(format: "%02x", $0) }.joined()
    
    return hashedPasswordString
}

struct ContentView: View {
    @State var password: String = ""
    @State var encryptedPassword: String = ""
    var body: some View {
        VStack {
            TextField("Password", text: $password)
            
            Button("Encrypt Password") {
                encryptedPassword = encryptPassword(password: password)
            }
            
            Text("Encrypted Password: \(encryptedPassword)")
        }
    }
}

struct ContentViewEnhanced: View {
    @State var password: String = ""
    @State var encryptedPassword: String = ""
    @State var hideEncryptedPassword: Bool = false
    var body: some View {
        VStack {
            TextField("Password", text: $password)
                .frame(width: 200, height: 40, alignment: .center)
                .border(.black)
            Button("Encrypt") {
                encryptedPassword = encryptPassword(password: password)
            }
            .bold()
            .foregroundColor(.white)
            .frame(width: 200, height: 40, alignment: .center)
            .background(Color.blue.cornerRadius(10))
            Text("Encrypted Password:")
                .bold()
            Group {
                if hideEncryptedPassword {
                    Text("\(encryptedPassword)")
                        .redacted(reason: .placeholder)
                } else {
                    Text("\(encryptedPassword)")
                }
            }
            Button(hideEncryptedPassword ? "Show" : "Hide") {
                hideEncryptedPassword.toggle()
            }
            .bold()
            .foregroundColor(.white)
            .frame(width: 200, height: 40, alignment: .center)
            .background(Color.blue.cornerRadius(10))
        }
        .padding(.horizontal)
    }
}
