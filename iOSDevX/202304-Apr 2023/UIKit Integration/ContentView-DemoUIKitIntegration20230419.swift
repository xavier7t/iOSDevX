//
//  ContentView-DemoUIKitIntegration20230419.swift
//  iOSDevX
//
//  Created by Xavier on 4/19/23.
//

import SwiftUI

struct ContentView_DemoUIKitIntegration20230419: View {
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                Text("Sample 1 - UIActivityIndicatorView")
                    .bold()
                    .font(.title3)
                ActivityIndicator()
                Text("Loading...")
                Divider()
                Text("Sample 2 - UILabel items in a UIStackView")
                    .bold()
                    .font(.title3)
                LabelStack()
                    .padding(.bottom, 250)
//                Spacer().frame(height: 100)
            }
            .navigationTitle("UIKit ➡️ SwiftUI")
        }
    }
}

extension ContentView_DemoUIKitIntegration20230419 {
    
    struct ActivityIndicator: UIViewRepresentable {
        func makeUIView(context: Context) -> UIActivityIndicatorView {
            return UIActivityIndicatorView(style: .large)
        }
        
        func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
            uiView.startAnimating()
        }
    }

    struct LabelStack: UIViewRepresentable {
        func makeUIView(context: Context) -> UIStackView {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .leading
            stackView.spacing = 5
            
            let label1 = UILabel()
            label1.text = "Label 1"
            
            let label2 = UILabel()
            label2.text = "Label 2"
            
            stackView.addArrangedSubview(label1)
            stackView.addArrangedSubview(label2)
            
            return stackView
        }
        
        func updateUIView(_ uiView: UIStackView, context: Context) {
        }
    }

}

struct ContentView_DemoUIKitIntegration20230419_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoUIKitIntegration20230419()
    }
}
