//
//  ContentView.swift
//  example
//
//  Created by Nemo on 19/8/24.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let result1 = maxTreasureValue1(value1: 10, weight1: 5, value2: 6, weight2: 4, maxW: 8)
        let result2 = maxTreasureValue1(value1: 10, weight1: 5, value2: 6, weight2: 4, maxW: 9)
        let result3 = maxTreasureValue1(value1: 5, weight1: 3, value2: 7, weight2: 4, maxW: 6)
        
        let result4 = maxTreasureValue2(values: [10, 6], weights: [5, 4], maxW: 8)
        let result5 = maxTreasureValue2(values: [10, 6], weights: [5, 4], maxW: 9)
        let result6 = maxTreasureValue2(values: [5, 7], weights: [3, 4], maxW: 6)

        
        print("Result 1: \(result1)")
        print("Result 2: \(result2)")
        print("Result 3: \(result3)")
        print("Result 4: \(result4)")
        print("Result 5: \(result5)")
        print("Result 6: \(result6)")
    }
    
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
