//
//  ViewModel.swift
//  DemoSearchable20230207
//
//  Created by Xavier on 2/7/23.
//

import Foundation

class ViewModel20230207: ObservableObject {
    @Published var persons: [Person20230207]
    
    init() {
        self.persons = [
            Person20230207(name: "Macy", age: 30),
            Person20230207(name: "Jemma", age: 37),
            Person20230207(name: "Harris", age: 25),
            Person20230207(name: "Maximilian", age: 41),
            Person20230207(name: "Cruz", age: 26),
            Person20230207(name: "Gladys", age: 29),
            Person20230207(name: "Robyn", age: 19),
            Person20230207(name: "Hiba", age: 80),
            Person20230207(name: "Issac", age: 22),
            Person20230207(name: "Omer", age: 36),
        ]
    }
}
