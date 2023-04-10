//
//  ContentView-DemoAttributedString20230409.swift
//  iOSDevX
//
//  Created by Xavier on 4/9/23.
//

import SwiftUI

struct ContentView_DemoAttributedString20230409: View {
    var attributedString = NSMutableAttributedString()
    
    init() {
        let hello = NSAttributedString(string: "Hello, ", attributes: [.font: UIFont.boldSystemFont(ofSize: 20)])
        let world = NSAttributedString(string: "World!", attributes: [.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(red: 1, green: 0, blue: 0, alpha: 1)])
        attributedString.append(hello)
        attributedString.append(world)
    }

    var body: some View {
        Text("\(attributedString)")
    }
}

struct ContentView_DemoAttributedString20230409_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoAttributedString20230409()
    }
}

