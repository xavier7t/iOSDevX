//
//  ContentView.swift
//  DemoSearchable20230207
//
//  Created by Xavier on 2/7/23.
//

import SwiftUI

struct DemoSearchable20230207: View {
    
    @StateObject private var vm = ViewModel20230207()
    
    @State private var searchText: String = ""
    
    //-------New lines: filteredPersons to be used in ForEach
    var filteredPersons: [Person20230207] {
        if searchText == "" {
            //show all persons if no searchText input
            return vm.persons
        } else {
            return vm.persons.filter { person in
                
                //filter the persons by name or age
                person.name.lowercased().contains(searchText.lowercased()) // comparing the lowercased texts
                ||
                "\(person.age)".contains(searchText) // comparing the input against the person’s age as a text
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                //-------Changed line: data source should now be the filteredPersons array
                ForEach(filteredPersons, id: \.self) { person in
                    HStack {
                        Text(person.name)
                            .bold()
                        Spacer()
                        Text("\(person.age)")
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Persons")
            .searchable(text: $searchText)
        }
    }
}

struct DemoSearchable20230207_Previews: PreviewProvider {
    static var previews: some View {
        DemoSearchable20230207()
    }
}
