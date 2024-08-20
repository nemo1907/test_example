//
//  LoadingView.swift
//  example
//
//  Created by Nemo on 19/8/24.
//

import SwiftUI

struct LoadingView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.red.opacity(0.3))
                .frame(width: 100, height: 100)
                .scaleEffect(animationAmount)
                .opacity(Double(3 - animationAmount))

            Image("img_wall_e")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(50)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 3)
                )
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                self.animationAmount = 3
            }
        }
    }
}


#Preview {
    LoadingView()
}
