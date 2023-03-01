//
//  DemoInitializers20230228.swift
//  iOSDevX
//
//  Created by Xavier on 2/28/23.
//

import Foundation


struct DemoInitializers20230228 {
    //MARK: Default initializer
    // Default initializers with all properties
    struct User {
        let id: UUID
        let name: String
        let createdAt: Date
    }
    
    let user1 = User(id: UUID(), name: "Río", createdAt: Date())
    let user2: User = .init(id: UUID(), name: "Sanah", createdAt: Date())
    
    // Default initializers when properties have a default value
    struct Student {
        let id = UUID()
        let name: String
        let createdAt = Date()
    }
    let student: Student = .init(name: "Thompson")
    
    //MARK: Custom initializers
    // Custom initializers with custom argument label
    struct Professor {
        let id: String
        let name: String
        let createdAt = Date()
        
        init(idNumber id: Int, name: String) {
            self.id = "U\(id)"
            self.name = name
        }
    }
    let professor: Professor = .init(idNumber: 123, name: "Usaraki")
    
    // Custom initializers without an arg labal
    struct Director {
        let id = UUID()
        let name: String
        let createdAt = Date()
        
        init(_ name: String) {
            self.name = name
        }
    }
    let director: Director = .init("William")
    
    //MARK: Designated vs Convenience initializers for Classes
    // Custom initializers without an arg labal
    class Manager {
        let id = UUID()
        let name: String
        let createdAt = Date()
        
        init(_ name: String) {
            self.name = name
        }
    }
    let manager: Manager = .init("Victor")
    
    class Employee {
        let id = UUID()
        let name: String
        let createdAt = Date()
        var department: String
        
        // designated initializer that’s more generic
        init(name: String, department: String) {
            self.name = name
            self.department = department
        }
        
        // convenience init for production department
        convenience init(_ name: String) {
            self.init(name: name, department: "PRD")
        }
    }
    let employee1: Employee = .init("Andrew") // deparment is "PRD"
    let employee2: Employee = .init(name: "Bessia", department: "FIN") // department is "FIN"

}
