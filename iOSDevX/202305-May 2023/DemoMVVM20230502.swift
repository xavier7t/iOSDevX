//
//  DemoMVVM20230502.swift
//  iOSDevX
//
//  Created by Xavier on 5/2/23.
//

import SwiftUI

struct DemoMVVM20230502 {
    struct Post {
        let id: Int
        let title: String
        let description: String
    }
    class PostViewModel: ObservableObject {
        @Published var posts: [Post] = []
        func getPosts() {
            posts = [
                .init(id: 1, title: "Lorem ipsum dolor sit amet", description: "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"),
                .init(id: 2, title: "quis nostrud exercitation", description: "ullamco laboris nisi ut aliquip ex ea commodo consequat"),
                .init(id: 3, title: "Duis aute irure dolor in reprehenderit", description: "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
            ]
        }
    }
    struct ContentView: View {
        @StateObject var vm = PostViewModel()
        var body: some View {
            NavigationView {
                List {
                    ForEach(vm.posts, id: \.id) { post in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(post.title).bold()
                                Text(post.description)
                                    .lineLimit(2)
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Text("\(post.id)")
                                .bold()
                                .foregroundColor(.secondary)
                                .padding()
                        }
                    }
                }
                .navigationTitle("Posts - MVVM")
            }
            .onAppear {
                vm.getPosts()
            }
        }
    }
    struct Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}


