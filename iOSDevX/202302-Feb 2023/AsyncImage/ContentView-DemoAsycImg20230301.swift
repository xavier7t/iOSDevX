//
//  ContentView-DemoAsycImg20230301.swift
//  iOSDevX
//
//  Created by Xavier on 3/1/23.
//

import SwiftUI

struct ContentView_DemoAsycImg20230301: View {
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Demonstrating an async image from a URL
                Text("Valid URL:").bold()
                AsyncImage(url: URL(string: validURL)) { image in
                    image
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                } placeholder: {
                    ProgressView()
                }
                Divider()
                    .padding()
                // Demonstrating the placeholder
                Text("Invalid URL:").bold()
                AsyncImage(url: URL(string: invalidURL)) { image in
                    image
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                } placeholder: {
                    ProgressView()
                }
                Divider()
                    .padding()
                // Demonstrating data parsing
                Text("Base64 Data:").bold()
                AsyncImage(url: URL(string: imageData)) { image in
                    image
                } placeholder: {
                    ProgressView()
                }
            }
            .navigationTitle("Async Images")
        }
    }
    
    let validURL = "https://raw.githubusercontent.com/xavier7t/iOSDevX/main/iOSDevX/Assets.xcassets/demo.imageset/demo.png"
    let invalidURL = "/nothing.png"
    
    let imageData = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQ8AAAC6CAMAAACHgTh+AAAAjVBMVEX////wUTjvPhzvRSb5x8LwTjP+9fTwSzHyb171iXfwSi7wTTPvRyrvQSDvQyTwTzb6z8rvPBj96ef1kIT1l4v5wLn3r6bxX0r4urLwVz/97Or83trzgXP84+D3p57yaVfze2z2n5T719PxZE/zfGz2pJvxWUPybl30i37zdWX4ta7uJAD60czvNwz1g3AKgiSYAAAEpUlEQVR4nO3c6XaqOgAFYAIiFTKI4CxOdFBue97/8W6E0qIEi5Yu2rC/P9pqusheZCJQwwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIBfadi7wbLto/1hvRXj1g0YXfXaPuafEx1Nh9xGOIzomkji35pGFom5avvIf0TA7knjxCX9tg++eSG/Nw5CvHnbR9+4nn9/HPIMeWz7+JsmxHfyIGzcdgWaNbO+FQcRtO0aNIvUOT3ElfHHmrVdhSa91hlbxDxklbHZm7br0KTQrZEHoeuRW/lFrtOYe/Tq5EH8yNhWDct82HYlGmSX2oGyYXiyUTxVNC26brsSzembperFyjOGybXKpPzlE0ejWXs5DyfYqAYT8WxUBeK9tF2L5hTzEHb6wvdTVSCnE8SYqJqM/dB2LZpTyEPEW5pWb9p/VowlTjoxXysC0TQPQmdBOoS4A+OBKk6QxanAofyJrnkIunhK13ZsZjyWZ/F0kpaY2l3JgwjXGPtyuBU8Mg6lhuEd0xJRaTmsbR7EeTEiKjtTe24Yu8uxRNBsHrq+PHX0zYPQwOg/yPrSgZGdKkVsn5W5bDEa55FezQhNQVgil3r8vOI0ycr0LpqSznmQt6VhzEw7nW4syNm464bvhS7WPFrnIU6r1WhK5WAjPz4W+4qPefnFCaJ1HsSLT93mwfTI6fOdKcp5GLHdnTyIm1Z7xmg6vg59r5zH+TVGzfMgPO0nRrF/yF5pKY8+71Ie+SXz8L9sQAne24xz+Ch21qNqn4dg2cbs3s+m6GOeVv9jfJHrXNqlPIjwX7OPD9mlwNHm1GFYn9vXS9apPORKZpF9Pnx/3TGbmNFnOb9becjFyuj8i8u5VdyqnYtu5UFs73IXYRcWflg5HcuDeFdvZTh0Lg/i5X2ISgfzILY1qizXxTyIqA5E8zwq9u/ziVmZ3uOLeAlM5TalYBU3MxQXMPrlQazx0FZsMUhmqCoW6T4/9Rf9wHRV54il2p09W/DrmIdw5PtAWKXNFSJMUi424lr3H5KT3uWTbHzqFKoqHG6tVfOyMdM8D+Ju018skkfKOE1xZm3HFbPUjad5HsQK8l+OhslaSobV8zHZYnTPg1jHW0p+XiLTNQ/ixjeUHHLt8yAe39cvagnt8yDCr39v3McSRuM8ZCcyr/sk2Ix2IQ95iqyuXQhaTsLBLr3K/Mo7kYecmrGwohtZ7J5N6jou8+S6d5/n4d00Lv1ufdXDL8JlsWIeFoU0X+EIf/yZh1b3n1L1ffq2xY6TYk+ynMRn672312Weh6tcAv9Rm/IKLm8GlNHN4yBJknC1ke/Pvyimk/zmEKrTAx/BtecbhO04ch3jOuW73GWjyt+xGyYtv97wGw8Tvgej1wNSFR1IfTp1p8YXDaYO/8oq+A/qq68k1+YO2q5Bw2Z3P519Iq7t4v1N2++0GFOnwfbd9O5AhDlp++B/wvHOQdezNHs4Ozd5U+69fHFy8Dj6+k//Tf3A4a5iFlqZhZzNzzXsOgp6Yez63KnD8ufbJ51m6ZX2/wZf+6fr/8kBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADQwv/ORj9orOzxtwAAAABJRU5ErkJggg=="
}

struct ContentView_DemoAsycImg20230301_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoAsycImg20230301()
    }
}
