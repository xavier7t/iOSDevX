//
//  DemoDecimalFormatter20230501.swift
//  iOSDevX
//
//  Created by Xavier on 5/1/23.
//

import SwiftUI

extension Double {
    //MARK: - Using string interpolation
    func toString1(_ numOfDecimal: Int) -> String {
        return String(format: "%.\(numOfDecimal)f", self)
    }
    //MARK: - Using NSNumberFormatter
    func toString2(_ numOfDecimal: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = numOfDecimal
        return formatter.string(from: self as NSNumber) ?? ""
    }
}


struct DemoDecimalFormatter20230501: View {
    let pi = Double.pi
    @State private var digit: Int = 0
    var body: some View {
        NavigationView {
            
            VStack {
                Stepper("Number of digit (0-16)", value: $digit)
                    .onChange(of: digit) { newValue in
                        if newValue < 0 {
                            digit = 0
                        }
                        if newValue >= 16 {
                            digit = newValue - 1
                        }
                    }
                getRow("Unformatted", "\(pi)")
                getRow("String interpolation", pi.toString1(digit))
                getRow("NSNumberFormatter", pi.toString2(digit))
                Spacer()
            }
            .padding(.horizontal, 20)
            .navigationTitle("Decimal Formatters")
        }
    }
    func getRow(_ type: String, _ value: String) -> some View {
        VStack {
            Divider()
            HStack {
                Text(type).bold()
                Spacer()
                Text(value)
            }
        }
    }
}

struct DemoDecimalFormatter20230501_Previews: PreviewProvider {
    static var previews: some View {
        DemoDecimalFormatter20230501()
    }
}


