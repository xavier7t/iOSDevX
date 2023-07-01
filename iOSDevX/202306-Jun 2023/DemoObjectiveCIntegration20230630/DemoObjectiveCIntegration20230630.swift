//
//  DemoObjectiveCIntegration20230630.swift
//  iOSDevX
//
//  Created by Xavier on 7/1/23.
//

import SwiftUI
import UIKit


struct DemoObjectiveCIntegration20230630 {
    //MARK: - SwiftUI View
    struct ContentView: View {
        @State private var showOC: Bool = false
        var body: some View {
            OCView(showOC: $showOC)
                .onTapGesture {
                    showOC.toggle()
                }
        }
    }
    //MARK: - SwiftUI Preview
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    //MARK: - OCViewController Representable
    struct OCView: UIViewControllerRepresentable {
        @Binding var showOC: Bool
        func makeUIViewController(context: Context) -> DemoObjectiveCIntegration20230630_OCViewController {
            return DemoObjectiveCIntegration20230630_OCViewController()
        }
        
        func updateUIViewController(_ uiViewController: DemoObjectiveCIntegration20230630_OCViewController, context: Context) {
            uiViewController.label.text = showOC ? "Hello, Objective-C ViewController!" : "Hello, SwiftUI View!"
        }
        func makeCoordinator() -> Coordinator {
            Coordinator(parent: self, labelText: "")
        }
        class Coordinator {
            let parent: OCView
            var labelText: String = ""
            init(parent: OCView, labelText: String) {
                self.parent = parent
                self.labelText = labelText
            }
        }
    }
}
