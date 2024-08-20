//
//  ContentView.swift
//  example
//
//  Created by Nemo on 19/8/24.
//

import SwiftUI

struct ContentView: View {
    let tabs = Tab.tabs
    @State private var selectedTab: Int = 0
    @State var isLoading: Bool = true

    var body: some View {
        Group {
            if isLoading {
                LoadingView()
            } else {
                VStack {
                    HStack {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 25))
                        Text("tinder")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color.pinkishRed)
                    }
                    Spacer()
                    ZStack {
                        HomeView()
                            .opacity(selectedTab == 0 ? 1 : 0)
                        LikeView()
                            .opacity(selectedTab == 1 ? 1 : 0)
                        MessagesView()
                            .opacity(selectedTab == 2 ? 1 : 0)
                        ProfileView()
                            .opacity(selectedTab == 3 ? 1 : 0)
                    }

                    HStack {
                        Spacer()
                        ForEach(tabs, id: \.id) { tab in
                            Image(systemName: tab.image)
                                .font(.system(size: 25))
                                .foregroundColor(tab.id == selectedTab ? tab.color : Color.gray.opacity(0.7))
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        selectedTab = tab.id
                                    }
                                }
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Color(UIColor.systemBackground))
                }
                .background(.white)
            }
        }.onAppear {
            onAppearCalled()
        }
    }

    private func onAppearCalled() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}


#Preview {
    ContentView()
}
