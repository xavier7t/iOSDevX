//
//  ContentView-DemoImageCaching20230418.swift
//  iOSDevX
//
//  Created by Xavier on 4/18/23.
//

import SwiftUI

struct ContentView_DemoImageCaching20230418: View {
    let urlString = "https://github.com/xavier7t/iOSDevX/blob/main/iOSDevX/Assets.xcassets/demo.imageset/demo.png?raw=true"
    var body: some View {
        NavigationView {
            RemoteImage(url: urlString)
                .frame(width: 150, height: 150, alignment: .center)
                .cornerRadius(10)
                .navigationTitle("Image Caching")
        }
    }
}

struct ContentView_DemoImageCaching20230418_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoImageCaching20230418()
    }
}

extension ContentView_DemoImageCaching20230418 {
    
    class ImageCache {
        static let shared = ImageCache()

        private let cache = NSCache<NSString, UIImage>()

        private init() {}

        func set(_ image: UIImage, forKey key: String) {
            cache.setObject(image, forKey: key as NSString)
        }

        func get(forKey key: String) -> UIImage? {
            return cache.object(forKey: key as NSString)
        }
    }
    class ImageLoader: ObservableObject {
        @Published var image: UIImage?

        private var url: String
        private var task: URLSessionDataTask?

        init(url: String) {
            self.url = url
            loadImage()
        }

        private func loadImage() {
            let imageCache = ContentView_DemoImageCaching20230418.ImageCache.shared
            if let cachedImage = imageCache.get(forKey: url) {
                self.image = cachedImage
                return
            }

            guard let url = URL(string: url) else { return }

            task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }

                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.image = image
                    imageCache.set(image!, forKey: self.url)
                }
            }
            task?.resume()
        }
    }
    
    struct RemoteImage: View {
        @ObservedObject var imageLoader: ImageLoader

        init(url: String) {
            imageLoader = ImageLoader(url: url)
        }

        var body: some View {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                ProgressView()
            }
        }
    }



}
