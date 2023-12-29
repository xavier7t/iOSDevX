//
//  DemoCustomToggle20231229.swift
//  iOSDevX
//
//  Created by Xavier on 12/29/23.
//

import SwiftUI

struct DemoCustomToggle20231229 {
    struct ContentView: View {
        var body: some View {
            VStack {
                ToggleView(text: "Custom Toggle On", isOn: .constant(true))
                ToggleView(text: "Custom Toggle Off", isOn: .constant(false))
            }
            .padding()
        }
    }
    
    struct ToggleView: View {
        let text: LocalizedStringKey
        @Binding var isOn: Bool
        private var circleOffset: CGFloat {
            isOn ? 11 : -11
        }
        var body: some View {
            HStack {
                Text(text)
                Spacer()
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(isOn ? .orange : .accentColor)
                    .frame(width: 51,
                           height: 31)
                    .overlay(
                        Circle()
                            .frame(width: 25,
                                   height: 25)
                            .foregroundColor(.white)
                            .padding(3)
                            .overlay(
                                Image(systemName: isOn ? "checkmark" : "xmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .font(.title.weight(.bold))
                                    .frame(width: 10,
                                           height: 10)
                                    .foregroundColor(isOn ? .orange : .accentColor)
                            )
                            .offset(x: circleOffset)
                    )
                    .animation(.linear(duration: 0.15), value: isOn)
                    .onTapGesture { isOn.toggle() }
            }
        }
    }
}

struct DemoCustomToggle20231229_Previews: PreviewProvider {
    static var previews: some View {
        DemoCustomToggle20231229.ContentView()
    }
}

