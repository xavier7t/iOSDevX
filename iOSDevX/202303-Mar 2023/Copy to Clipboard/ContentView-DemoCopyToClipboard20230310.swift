//
//  ContentView-DemoCopyToClipboard20230310.swift
//  iOSDevX
//
//  Created by Xavier on 3/10/23.
//

import SwiftUI

import SwiftUI
import UniformTypeIdentifiers
struct ContentView_DemoCopyToClipboard20230310: View {
    var code: String = "009183"
    @State private var isCopied: Bool = false
    var body: some View {
        VStack {
            Text("Your code is: ")
                .font(.title)
            if isCopied {
                Text("Copied successfully!")
                    .foregroundColor(.white)
                    .bold()
                    .font(.footnote)
                    .frame(width: 140, height: 30)
                    .background(Color.indigo.cornerRadius(7))
            }
            Text(code)
                .font(.largeTitle)
                .bold()
                .padding()
                .onTapGesture(count: 2) {
                    let clipboard = UIPasteboard.general
                    clipboard.setValue(code, forPasteboardType: UTType.plainText.identifier)
                    withAnimation {
                        isCopied = true
                    }
                    DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3) {
                        withAnimation {
                            isCopied = false
                        }
                    }
                }
            Text("Double tap to copy your code to clipboard.")
                .font(.footnote)
                .bold()
        }
        .padding()
        
    }
}
struct ContentView_DemoCopyToClipboard20230310_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ContentView_DemoCopyToClipboard20230310()
    }
}

