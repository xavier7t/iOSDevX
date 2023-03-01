//
//  ContentView-DemoCodableImage20230211.swift
//  iOSDevX
//
//  Created by Xavier on 2/28/23.
//

import SwiftUI

struct ContentView_DemoCodableImage20230211: View {
    @State private var str: String = ""
    var body: some View {
        VStack {
            Spacer()
            Text("Image Encoded")
                .font(.title2)
                .bold()
            Text(str)
                .lineLimit(10)
            Spacer()
            
            if let decodedImage = decodedImage(str) {
                decodedImage
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                Text("Image Decoded")
                    .font(.title2)
                    .bold()
            }
            Spacer()
        }
        .padding()
        .onAppear {
            str = encodedImage("demo")
        }
    }
    
    func encodedImage(_ imageName: String) -> String {
        UIImage(named: imageName)?.pngData()?.base64EncodedString() ?? ""
    }

    func decodedImage(_ encodedImage: String) -> Image? {
        guard let imageData = Data(base64Encoded: encodedImage) else {
            return nil
        }
        return Image(uiImage: UIImage(data: imageData) ?? UIImage(named: "demo")!)
    }

}

struct ContentView_DemoCodableImage20230211_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoCodableImage20230211()
    }
}
