//
//  ContentView-DemoCoreData20230210.swift
//  iOSDevX
//
//  Created by Xavier on 2/27/23.
//

import SwiftUI

struct ContentView_DemoCoreData20230210: View {
    @StateObject var vm: ViewModel = ViewModel()

    var body: some View {
        NavigationStack {
            Group {
                // when no notes found, display a hint message
                if vm.notes.count == 0 {
                    Text("No note saved yet. Press the New button to create one")
                        .bold()
                        .foregroundColor(.secondary)
                } else {
                    List {
                        ForEach(vm.notes) { note in
                            // Note Row
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack {
                                        
                                        // title
                                        Text(note.title ?? "")
                                            .font(.title3)
                                            .lineLimit(1)
                                            .bold()
                                            
                                        // date
                                        Text(note.createdAt?.asString() ?? "")
                                            .lineLimit(1)
                                    }
                                    
                                    // body preview
                                    Text((note.body ?? ""))
                                        
                                        .lineLimit(1)
                                }
                                Spacer()
                                
                                // fav icon
                                Image(systemName: note.isFavorite ? "star.fill" : "star")
                                    .onTapGesture {
                                        vm.toggleFav(note: note)
                                    }
                                    .foregroundColor(note.isFavorite ? .yellow : .secondary)
                            }
                            
                            // delete option on swipe
                            .swipeActions {
                                Button(role: .destructive) {
                                    vm.deleteNote(note: note)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                // new note button
                Button("New") {
                    vm.showAlert = true
                }
                .alert(vm.noteTitle, isPresented: $vm.showAlert, actions: {
                    TextField("Title", text: $vm.noteTitle)
                    TextField("Body", text: $vm.noteBody)
                    Button("Save", action: {
                        vm.createNote()
                        vm.clearStates()
                    })
                    Button("Cancel", role: .cancel, action: { vm.clearStates() })
                }) {
                    Text("Create a new note")
                }
            }
        }
    }
}

struct ContentView_DemoCoreData20230210_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoCoreData20230210()
    }
}



extension Date {
    func asString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
