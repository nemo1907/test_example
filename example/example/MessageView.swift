//
//  MessageView.swift
//  example
//
//  Created by Nemo on 19/8/24.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        VStack(spacing: 55) {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 3)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray.opacity(0.05))
                    )
                    .frame(width: 130, height: 180)
                    .offset(y: 20)
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.green, lineWidth: 3)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.mintCream)
                    )
                    .frame(width: 130, height: 180)
                    .rotationEffect(.degrees(20))
                    .offset(x: 50)
                Text("LIKE")
                    .bold()
                    .font(.title3)
                    .foregroundColor(.green)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.green, lineWidth: 3)
                    )
                    .rotationEffect(.degrees(-10))
                    .offset(x: 50)
            }
            VStack(spacing: 20) {
                Text("Get Swiping")
                    .font(.title3)
                    .bold()
                Text("When you match with other users they'll appear here, where you can send them a message")
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 60/255, green: 60/255, blue: 60/255))
                    .padding(.horizontal, 20)
            }
            Spacer()
        }
    }
}

#Preview {
    MessagesView()
}
