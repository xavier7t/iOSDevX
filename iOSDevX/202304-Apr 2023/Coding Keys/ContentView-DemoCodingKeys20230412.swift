//
//  ContentView-DemoCodingKeys20230412.swift
//  iOSDevX
//
//  Created by Xavier on 4/12/23.
//

import SwiftUI

struct ContentView_DemoCodingKeys20230412: View {
    //MARK: - Person Struct
    struct Person: Codable {
        var name: String
        var age: Int
        var email: String
        
        //MARK: Coding Keys
        enum CodingKeys: String, CodingKey {
            case name = "full_name"
            case age
            case email = "email_address"
        }
    }
    //MARK: - JSON Data
    let json = """
    {
      "full_name": "John Doe",
      "age": 30,
      "email_address": "johndoe@example.com"
    }
    """.data(using: .utf8)!

    let decoder: JSONDecoder
    let person: Person
    
    init() {
        //MARK: - JSON Decoding Logic
        self.decoder = JSONDecoder()
        self.person = try! decoder.decode(Person.self, from: json)
    }

    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(.accentColor)
            VStack(alignment: .leading) {
                Text("\(person.name)")
                    .bold()
                    .font(.title)
                Group {
                    Text("\(person.age) years old")
                    Text("\(person.email)")
                }
                .font(.title2)
            }
            
        }
    }
}
struct ContentView_DemoCodingKeys20230412_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoCodingKeys20230412()
    }
}



