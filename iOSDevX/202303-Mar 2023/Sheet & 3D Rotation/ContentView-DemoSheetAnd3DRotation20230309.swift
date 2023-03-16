//
//  ContentView-DemoSheetAnd3DRotation20230309.swift
//  iOSDevX
//
//  Created by Xavier on 3/9/23.
//

import SwiftUI

struct ContentView_DemoSheetAnd3DRotation20230309: View {
    @State private var showSheet: Bool = false
    @State private var rotationDegree: Double = 0
    var body: some View {
        NavigationStack {
            ScrollView {
                Button {
                    showSheet.toggle()
                } label: {
                    Label("Preview Photo Frame", systemImage: "eye.fill")
                }
                .sheet(isPresented: $showSheet) {
                    sheet
//                    .presentationDetents([.medium])
                        .presentationDetents([.fraction(0.50)]) // iOS 16.0 +
                        .presentationCornerRadius(50) // iOS 16.4 + 
                }
                Image("demo")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .navigationTitle("Home")
        }
    }
    var sheet: some View {
        NavigationStack {
            VStack {
                Text("Xavier’s Photo Frame")
                    .font(.title)
                    .bold()
                    .padding(.top, 60)
                Image("demo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .rotation3DEffect(.degrees(rotationDegree), axis: (x: 0, y: 1, z: 0))
                    .onAppear {
                        withAnimation(.linear(duration: 18).repeatForever(autoreverses: false)) {
                            print("animating")
                            rotationDegree += 360
                        }
                    }
                    .padding(.vertical, 50)
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Continue")
                        .foregroundColor(.primary)
                        .bold()
                        .frame(width: 170, height: 40)
                        .background(Color.primary.opacity(0.1).cornerRadius(10))
                        .padding(.vertical, 20)
                }
                Spacer()
                    .padding(.bottom, 45)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.primary.opacity(0.3))
                            .padding(.trailing, 5)
                            .padding(.top, 5)
                    }

                }
            }
        }
    }
}

struct ContentView_DemoSheetAnd3DRotation20230309_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_DemoSheetAnd3DRotation20230309()
    }
}

