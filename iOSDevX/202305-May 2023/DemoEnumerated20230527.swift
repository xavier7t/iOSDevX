//
//  DemoEnumerated20230527.swift
//  iOSDevX
//
//  Created by Xavier on 5/27/23.
//

import SwiftUI
struct DemoEnumerated20230527 {
    struct ContentView: View {
        @State private var transactions: [Transaction] = []
        var body: some View {
            NavigationView {
                ScrollView {
                    ForEach(Array(transactions.enumerated()), id: \.element.id) { offset, transaction in
                        HStack {
                            Text("\(offset + 1)").frame(width: 40)
                            Text(transaction.date.formatted(date: .abbreviated, time: .omitted))
                            Spacer()
                            Text("$" + transaction.amount.toString1(2))
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 11)
                        .background(offset % 2 == 0 ? Color.secondary.opacity(0.5) : Color.clear)
                    }
//                    ForEach(transactions) { transaction in
//                        HStack {
//                            Text(transaction.date.formatted(date: .abbreviated, time: .omitted))
//                            Spacer()
//                            Text("$" + String(format: "%.2f", transaction.amount))
//                        }
//                        .padding(.horizontal, 20)
//                        .padding(.vertical, 5)
//                    }
                }
                .navigationTitle("Transaction Records")
            }
            .onAppear {
                for _ in 0...49 {
                    transactions.append(.init(
                        date: Calendar.current.date(from: .init(year: Int.random(in: 2010...2022), month: Int.random(in: 2...10), day: Int.random(in: 1...20)))!,
                        amount: Double.random(in: 10...200))
                    )
                }
                transactions.sort { $0.date > $1.date }
            }
        }
    }
    struct Transaction: Identifiable {
        let id = UUID()
        let date: Date
        let amount: Double
    }
}


struct DemoEnumerated20230527_Previews: PreviewProvider {
    static var previews: some View {
        DemoEnumerated20230527.ContentView()
    }
}
