//
//  ContentView-DemoRedaction20230407.swift
//  iOSDevX
//
//  Created by Xavier on 4/7/23.
//

import SwiftUI

struct ContentView_DemoRedaction20230407: View {
    let name = "John Doe"
    let email = "johndoe@example.com"
    let creditCard = "1234 5678 9012 3456"

    var body: some View {
        HStack {
            content
            content
                .redacted(reason: .placeholder)
        }
    }
    var content: some View {
        VStack(alignment: .leading) {
            Text("Profile")
                .underline()
                .bold()
                .unredacted()
            Image("demo")
                .resizable()
                .clipShape(Circle())
                .frame(width: 120, height: 120, alignment: .center)
            Text(name)
                .foregroundColor(.pink)
                .font(.largeTitle)
                .bold()
            Text(email)
                .foregroundColor(.blue)
                .bold()
            Text(creditCard)
                .bold()
        }
    }
}


struct ContentView_DemoRedaction20230407_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView_DemoRedaction20230407()
                .navigationTitle("Redaction")
        }
    }
}
