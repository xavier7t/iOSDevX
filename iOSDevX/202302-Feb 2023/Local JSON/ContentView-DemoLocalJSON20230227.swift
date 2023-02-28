//
//  ContentView-DemoLocalJSON20230227.swift
//  iOSDevX
//
//  Created by Xavier on 2/27/23.
//

import SwiftUI

struct ContentView_DemoLocalJSON20230227: View {
    @State private var info: String = ""
    var body: some View {
        Text(info)
            .onAppear {
                onAppear()
            }
    }
    
    func onAppear() {
        var users: [User] = read(filename: "DemoUsers20230227.json") ?? []
        let countOfUsersBeforeWriting = users.count
        users = [
            .init(uid: UUID(), name: "Josh", createdAt: Date()),
            .init(uid: UUID(), name: "Katy", createdAt: Date()),
            .init(uid: UUID(), name: "Logan", createdAt: Date()),
            .init(uid: UUID(), name: "Miguel", createdAt: Date())
        ]
        write(array: users, filename: "DemoUsers20230227.json")
        users = read(filename: "DemoUsers20230227.json") ?? []
        info = """
        Before writing:
        Total # of users: \(countOfUsersBeforeWriting)
        After writing:
        Total # of users: \(users.count)
        """
    }
    
    // Read data from JSON
    func read<T: Codable>(filename: String) -> T? {
        var data: Data?
        var file: URL
        
        //get file directory
        do {
            file = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(filename)
        } catch {
            fatalError("Coudn't read or create \(filename): \(error.localizedDescription)")
        }
        
        //get data
        do {
            data = try Data(contentsOf: file)
        } catch {
            print("Couldn't load \(filename) from main bundle or document directory :\n\(error)")
        }

        guard data != nil else { return nil }
        
        //decode data (convert data to model)
        do {
            let decoder = JSONDecoder()
            print("Reading...  📖: \(file.description)")
            return try decoder.decode(T.self, from: data!)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }


    // Write data to JSON
    func write<T: Codable>(array: [T], filename: String) {
//        var array1 = array
//        array1 = []
        // get file URL
        var file: URL
        do {
            file = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(filename)
        } catch {
            fatalError("Coudn't read or create \(filename): \(error.localizedDescription)")
        }
        
        // encode the array with new entry and write to JSON file
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            print("Writing...  📖: \(file.description)")
            try encoder.encode(array).write(to: file)
        } catch {
            print("Couldn’t save new entry to \(filename), \(error.localizedDescription)")
        }
    }

    struct User: Codable {
        var uid: UUID
        let name: String
        var createdAt: Date
    }

}

struct ContentView_DemoLocalJSON20230227_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoLocalJSON20230227()
    }
}
