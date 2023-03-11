//
//  ContentView-DemoCopyToClipboard20230310.swift
//  iOSDevX
//
//  Created by Xavier on 3/10/23.
//

import SwiftUI

//struct ContentView_DemoCopyToClipboard20230310: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct ContentView_DemoCopyToClipboard20230310_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView_DemoCopyToClipboard20230310()
//    }
//}
import SwiftUI
import UniformTypeIdentifiers
struct TestView: View {
    var code: String = "009183"
    @State private var isCopied: Bool = false
    var body: some View {
            VStack {
                Text("Your code is: ")
                    .font(.title)
                if isCopied {
                    Text("Copied successfully!")
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
                            isCopied.toggle()
                        }
                            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3) {
                                withAnimation {
                                    isCopied.toggle()
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
struct TestView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

