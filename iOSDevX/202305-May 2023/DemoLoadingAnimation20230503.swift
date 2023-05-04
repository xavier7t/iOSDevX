//
//  DemoLoadingAnimation20230503.swift
//  iOSDevX
//
//  Created by Xavier on 5/3/23.
//

import SwiftUI

struct DemoLoadingAnimation20230503: View {
    var body: some View {
        ContentView()
    }
    class ViewModel: ObservableObject {
      @Published var isLoading = false
      var data: [String] = []

      func loadData() {
        isLoading = true
        // Code to load data goes here
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Simulate loading delay
          self.data = ["Data 1", "Data 2", "Data 3"]
          self.isLoading = false
        }
      }
    }
    struct SpinnerView: View {
      @State private var isAnimating = false

      var body: some View {
        VStack {
          Circle()
            .trim(from: 0, to: 0.7)
            .stroke(LinearGradient(colors: [.blue, .green], startPoint: .bottom, endPoint: .top), lineWidth: 5)
            .frame(width: 70, height: 70)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: UUID())
            .onAppear {
              self.isAnimating = true
            }
        }
      }
    }
    struct ContentView: View {
      @StateObject var viewModel = ViewModel()

      var body: some View {
        VStack {
          if viewModel.isLoading {
            SpinnerView()
          } else {
            List(viewModel.data, id: \.self) { item in
              Text(item)
            }
          }
        }
        .onAppear {
          viewModel.loadData()
        }
      }
    }

}

struct DemoLoadingAnimation20230503_Previews: PreviewProvider {
    static var previews: some View {
        DemoLoadingAnimation20230503()
    }
}
