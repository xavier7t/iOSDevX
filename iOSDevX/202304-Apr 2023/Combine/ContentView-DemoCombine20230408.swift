//
//  ContentView-DemoCombine20230408.swift
//  iOSDevX
//
//  Created by Xavier on 4/8/23.
//

import SwiftUI
import Combine

struct ContentView_DemoCombine20230408: View {
    struct Post: Codable {
        let id: Int
        let body: String
        let title: String
    }
    class ViewModel: ObservableObject {
        @Published var data: [Post] = []
        private var cancellables = Set<AnyCancellable>()
        
        func fetchData() {
            URLSession.shared.dataTaskPublisher(for: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
                .map { $0.data }
                .decode(type: [Post].self, decoder: JSONDecoder())
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("Data loading finished")
                    case .failure(let error):
                        print("Data loading failed with error: \(error.localizedDescription)")
                    }
                } receiveValue: { [weak self] data in
                    self?.data = data
                }
                .store(in: &cancellables)
        }
    }
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        List(viewModel.data, id: \.id) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .bold()
                        .lineLimit(1)
                        .padding(.vertical)
                    Text(item.body)
                        .font(.footnote)
                        .lineLimit(2)
                }
                Spacer()
                Text("\(item.id)")
                    .bold()
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}



struct ContentView_DemoCombine20230408_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView_DemoCombine20230408()
                .navigationTitle("Async with Combine")
        }
    }
}
