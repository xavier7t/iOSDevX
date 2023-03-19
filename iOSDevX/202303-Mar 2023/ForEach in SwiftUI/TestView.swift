//
//  ContentView-DemoForEach20230318.swift
//  iOSDevX
//
//  Created by Xavier on 3/18/23.
//

import SwiftUI

struct ContentView_DemoForEach20230318: View {
    let numbers = [1, 2, 3, 4, 5]

    struct Person: Identifiable, Hashable {
        let id = UUID()
        let name: String
    }

    let people = [Person(name: "Alice"), Person(name: "Bob"), Person(name: "Charlie")]

    var body: some View {
        NavigationStack {
            List {
                Section {
                    basicUsage
                } header: {
                    Text("Basic Usage")
                }
                Section {
                    identifiableData
                } header: {
                    Text("Identifiable Data")
                }
                Section {
                    range
                } header: {
                    Text("Range")
                }
                Section {
                    condition
                } header: {
                    Text("Condition")
                }
                Section {
                    indices
                } header: {
                    Text("Condition")
                }
                Section {
                    shorthand
                } header: {
                    Text("Shorthand Syntax")
                }
            }
            .navigationTitle("ForEach in SwiftUI")
        }
    }
}




struct ContentView_DemoForEach20230318_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoForEach20230318()
    }
}

//MARK: - Basic Usage
extension ContentView_DemoForEach20230318 {
    private var basicUsage: some View {
        ForEach(numbers, id: \.self) { number in
            Text("\(number)")
        }
    }
}

//MARK: - Identifiable Data
extension ContentView_DemoForEach20230318 {
    private var identifiableData: some View {
        ForEach(people) { person in
            Text("\(person.name)")
        }
    }
}

//MARK: - Range
extension ContentView_DemoForEach20230318 {
    private var range: some View {
        ForEach(0..<10) { number in
            Text("\(number)")
        }
    }
}

//MARK: - Conditional Statement
extension ContentView_DemoForEach20230318 {
    var condition: some View {
        ForEach(numbers, id: \.self) { number in
            if number % 2 == 0 {
                Text("\(number)")
            }
        }
    }
}

//MARK: - Indices
extension ContentView_DemoForEach20230318 {
    private var indices: some View {
        ForEach(people.indices, id: \.self) { index in
            Text("\(people[index].name)")
        }
    }
}

//MARK: - Shorthand Syntax
extension ContentView_DemoForEach20230318 {
    private var shorthand: some View {
        Group {
            Text("General Syntax: ").bold()
            ForEach(people, id: \.self) { person in
                Text(person.name)
            }
            Text("Shorthand Syntax: ").bold()
            ForEach(people, id: \.self) {
                Text($0.name)
            }
        }
    }
}

