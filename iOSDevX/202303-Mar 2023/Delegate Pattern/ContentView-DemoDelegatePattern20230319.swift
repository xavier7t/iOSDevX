//
//  ContentView-DemoDelegatePattern20230319.swift
//  iOSDevX
//
//  Created by Xavier on 3/18/23.
//

import SwiftUI

// Define an Item model
struct Item_DemoDelegatePattern20230319: Identifiable {
    let id = UUID()
    var name: String
}

// Define a delegate protocol
protocol ItemSelectionDelegate_DemoDelegatePattern20230319 {
    func didSelectItem(item: Item_DemoDelegatePattern20230319)
}

// Create a view that uses the delegate
struct ItemListView_DemoDelegatePattern20230319: View {
    @State private var items = [Item_DemoDelegatePattern20230319]()
    var delegate: ItemSelectionDelegate_DemoDelegatePattern20230319?
    
    var body: some View {
        List(items) { item in
            HStack {
                Text(item.name)
            }
            .onTapGesture {
                delegate?.didSelectItem(item: item)
            }
        }
        .onAppear {
            items = [
                .init(name: "Item 1"),
                .init(name: "Item 2"),
                .init(name: "Item 3"),
                .init(name: "Item 4"),
                .init(name: "Item 5"),
                .init(name: "Item 6"),
                .init(name: "Item 7"),
            ]
        }
    }
}

// Create a parent view that implements the delegate protocol
struct ContentView_DemoDelegatePattern20230319: View {
    @State private var selectedItem: Item_DemoDelegatePattern20230319?
    
    var body: some View {
        VStack {
            Text("Selected item: \(selectedItem?.name ?? "None")")
            ItemListView_DemoDelegatePattern20230319(delegate: self)
        }
    }
}

extension ContentView_DemoDelegatePattern20230319: ItemSelectionDelegate_DemoDelegatePattern20230319 {
    func didSelectItem(item: Item_DemoDelegatePattern20230319) {
        selectedItem = item
    }
}

struct ContentView_DemoDelegatePattern20230319_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoDelegatePattern20230319()
    }
}


