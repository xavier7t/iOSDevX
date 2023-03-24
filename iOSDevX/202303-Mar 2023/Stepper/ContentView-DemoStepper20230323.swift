//
//  ContentView-DemoStepper20230323.swift
//  iOSDevX
//
//  Created by Xavier on 3/23/23.
//

import SwiftUI

struct ContentView_DemoStepper20230323: View {
    var body: some View {
        VStack {
            StepperView()
            StepperView2()
            StepperView3()
        }
    }
    // MARK: - Basic Usage
    struct StepperView: View {
        @State private var quantity = 0
        
        var body: some View {
            Stepper("Quantity: \(quantity)", value: $quantity)
                .foregroundColor(.indigo)
                .bold()
                .padding(.horizontal)
        }
    }
    // MARK: - Stepper with Step Value
    struct StepperView2: View {
        @State private var quantity = 0
        var body: some View {
            Stepper("Quantity: \(quantity)", value: $quantity, step: 100)
                .foregroundColor(.indigo)
                .bold()
                .padding(.horizontal)
        }
    }
    // MARK: - Stepper with an editing handler
    struct StepperView3: View {
        @State private var quantity = 0
        var body: some View {
            Stepper("Quantity: \(quantity)", value: $quantity, step: 100) { isEditing in
                print(isEditing)
            }
            .foregroundColor(.indigo)
            .bold()
            .padding(.horizontal)
        }
    }
}

// MARK: - Preview
struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoStepper20230323()
    }
}
