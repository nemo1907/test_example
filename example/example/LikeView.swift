//
//  LikeView.swift
//  example
//
//  Created by Nemo on 19/8/24.
//

import SwiftUI

struct LikeView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            TabSelectionView(selectedTab: $selectedTab)
            Divider()
            Spacer()
            if selectedTab == 0 {
                LikesSegmentView()
            } else {
                TopPicksSegmentView()
            }
        }
    }
}

struct TabSelectionView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            TabButton(title: "0 Likes", isSelected: selectedTab == 0)
                .onTapGesture {
                    selectedTab = 0
                }
                .frame(maxWidth: .infinity)
            
            Divider()
                .frame(height: 33)
            
            TabButton(title: "Top Picks", isSelected: selectedTab == 1)
                .onTapGesture {
                    selectedTab = 1
                }
                .frame(maxWidth: .infinity)
        }
        .padding(.vertical, 4)
    }
}

struct TabButton: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .font(.title3)
            .bold()
            .foregroundColor(isSelected ? .black : .gray)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct LikesSegmentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "heart.fill")
                .font(.system(size: 56))
                .foregroundColor(Color.gray.opacity(0.2))
            Text("Upgrade to Gold to see people who already liked you.")
                .frame(width: 230)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            Spacer()
            
            Button(action: {
            }) {
                Text("See who Likes you")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gold)
                    .cornerRadius(30)
                    .padding(.horizontal, 60)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 60)
        }
    }
}

struct TopPicksSegmentView: View {
    private let users: [User] = User.users
    private let gridLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Upgrade to Tinder Gold™ for more Top Picks!")
                    .bold()
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                    .foregroundColor(.gray)
                    .padding(20)
                Spacer()
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

#Preview {
    LikeView()
}
