//
//  ContentView-DemoRESTAPI20230305.swift
//  iOSDevX
//
//  Created by Xavier on 3/5/23.
//

import SwiftUI

struct ContentView_DemoRESTAPI20230305: View {
    
    @State var posts: [Post] = []
    //MARK: View body
    var body: some View {
        NavigationStack {
            List(posts) { post in
                HStack {
                    VStack(alignment: .leading) {
                        Text(post.title).bold().lineLimit(1).font(.title3)
                        Text(post.body).lineLimit(1).font(.footnote)
                    }
                    Spacer()
                    Text("Post #: \(post.id)")
                }
            }
            .navigationTitle("Posts from API")
            .onAppear {
                fetchData()
            }
        }
    }
    //MARK: Model
    struct Post: Codable, Identifiable {
        let id: Int
        let title: String
        let body: String
    }
    //MARK: Function to fetch post data
    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([Post].self, from: data)
                    self.posts = decodedData
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct ContentView_DemoRESTAPI20230305_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoRESTAPI20230305()
    }
}
