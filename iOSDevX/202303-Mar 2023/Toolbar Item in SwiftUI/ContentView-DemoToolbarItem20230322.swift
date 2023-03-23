//
//  ContentView-DemoToolbarItem20230322.swift
//  iOSDevX
//
//  Created by Xavier on 3/22/23.
//

import SwiftUI

struct ContentView_DemoToolbarItem20230322: View {
    var body: some View {
        //Switch the preview canvas to see the result of different views
        demo1
        demo2
        demo3
    }
}

struct Content1View_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoToolbarItem20230322()
    }
}

extension ContentView_DemoToolbarItem20230322 {
    // MARK: - Basic Usage - Edit button example
    private var demo1: some View {
        NavigationView {
            Text("My View")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Edit") {
                            // Handle edit button tap
                        }
                    }
                }
        }
    }
    // MARK: - Multiple toolbar items
    private var demo2: some View {
        NavigationView {
            Text("My View")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Edit") {
                            // Handle edit button tap
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Delete") {
                            // Handle delete button tap
                        }
                        .bold()
                        .foregroundColor(.red)
                    }
                }
        }
    }
    // MARK: - Any View
    private var demo3: some View {
        NavigationView {
            Text("My View")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.accentColor)
                            Spacer()
                                .frame(width: 20)
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
                .navigationTitle("Edit your profile")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


