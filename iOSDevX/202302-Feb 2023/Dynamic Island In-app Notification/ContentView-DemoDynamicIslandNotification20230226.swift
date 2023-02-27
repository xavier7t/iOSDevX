//
//  DemoDynamicIslandNotification20230226.swift
//  iOSDevX
//
//  Created by Xavier on 2/26/23.
//

import SwiftUI

struct DemoDynamicIslandNotification20230226: View {
    @State private var showType1: Bool = false
    @State private var showType2: Bool = false
    var body: some View {
        VStack {
            ZStack {
                CapsuleView(isShowing: $showType1)
                RoundedRectView(isShowing: $showType2)
            }
            .offset(y: -48)
            Spacer()
                .frame(height: 100)
            Button("Show Type 1", action: {
                let animation = Animation.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 2.1)
                withAnimation(animation) {
                    showType1.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    withAnimation(animation) {
                        showType1.toggle()
                    }
                })
            })
            Spacer()
                .frame(height: 50)
            Button("Show Type 2", action: {
                let animation = Animation.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 2.1)
                withAnimation(animation) {
                    showType2.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    withAnimation(animation) {
                        showType2.toggle()
                    }
                })
            })
            Spacer()
        }
    }
}

struct DemoDynamicIslandNotification20230226_Previews: PreviewProvider {
    static var previews: some View {
        DemoDynamicIslandNotification20230226()
    }
}

struct RoundedRectView: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: isShowing ? 50 : 25)
                .foregroundColor(.primary)
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "creditcard")
                        .resizable()
                        .frame(
                            width: isShowing ? 27 : 10,
                            height: isShowing ? 19 : 10)
                        .foregroundColor(.white)
                        .padding(isShowing ? 20 : 5)
                    
                    Spacer()
                    
                    VStack {
                        Text("Order placed,")
                        Text("Xavier!")
                    }
                    .foregroundColor(isShowing ? .white : .clear)
                    .font(.caption2)
                    
                    Spacer()
                    Image(systemName: "checkmark")
                        .resizable()
                        //.bold()
                    
                        .foregroundColor(isShowing ? .green : .clear)
                    
                        .frame(
                            width: isShowing ? 20 : 10,
                            height: isShowing ? 20 : 10)
                        .padding(isShowing ? 20 : 5)
                }
                if isShowing {
                    Text("Order #: 20220912")
                        .font(.caption)
                        .foregroundColor(isShowing ? .white : .clear)
                    Text("Estimated delivery: Tomorrow")
                        .font(.caption)
                        .foregroundColor(isShowing ? .white : .clear)
                }
                Spacer()
            }
            .frame(height: isShowing ? 200 : 37)
        }
        .frame(
            width: isShowing ? 0.9 * UIScreen.main.bounds.width : 125,
            height: isShowing ? 200 : 37
        )
    }
}

struct CapsuleView: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(.primary)
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(isShowing ? .green : .clear)
                    .frame(width: 20, height: 20)
                Spacer()
                Text("Completed!")
                    .foregroundColor(isShowing ? .white : .clear)
                    .font(.footnote)
            }
            .padding(.horizontal)
        }
        .frame(width: isShowing ? 0.8 * UIScreen.main.bounds.width : 125, height: 37)
    }
}
