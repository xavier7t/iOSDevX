//
//  ContentView-DemoStepper20230323.swift
//  iOSDevX
//
//  Created by Xavier on 3/23/23.
//

import SwiftUI

struct ContentView_DemoStepper20230323: View {
    var body: some View {
        NavigationStack {
            VStack {
                StepperView()
                StepperView2()
                StepperView3()
            }
            .navigationTitle("Steppers")
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
struct ContentView_DemoStepper20230323_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoStepper20230323()
    }
}
