//
//  HomeView.swift
//  example
//
//  Created by Nemo on 19/8/24.
//

import SwiftUI

struct HomeView: View {
    private let menus = HomeMenu.menus
    @State private var users: [User] = User.users
    @State private var translation: CGSize = .zero
    @State private var activeState: CardView.CardState? = nil
    @State private var currentIndex = 0
    
    var body: some View {
        ZStack {
            ForEach(currentIndex..<users.count, id: \.self) { index in
                CardView(user: users[index], translation: index == currentIndex ? $translation : .constant(.zero), activeState: index == currentIndex ? $activeState : .constant(nil))
                    .shadow(radius: 4)
                    .offset(x: index == currentIndex ? translation.width : 0,
                            y: index == currentIndex ? translation.height : 0)
                    .scaleEffect(index == currentIndex ? 1 : 0.95)
                    .rotationEffect(.degrees(index == currentIndex ? Double(translation.width / 20) : 0))
                    .opacity(index == currentIndex ? 1 : 0.9)
                    .gesture(
                        index == currentIndex ?
                        DragGesture()
                            .onChanged { value in
                                translation = value.translation
                                if translation.width > 30 {
                                    activeState = .like
                                } else if translation.width < -30 {
                                    activeState = .nope
                                } else if translation.height < -30 {
                                    activeState = .superlike
                                } else {
                                    activeState = nil
                                }
                            }
                            .onEnded { _ in
                                withAnimation(.easeInOut) {
                                    if abs(translation.width) > 150 || abs(translation.height) > 150 {
                                        if translation.width > 150 {
                                            translation.width = UIScreen.main.bounds.width
                                        } else if translation.width < -150 {
                                            translation.width = -UIScreen.main.bounds.width
                                        } else if translation.height < -150 {
                                            translation.height = -UIScreen.main.bounds.height
                                        }
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            currentIndex += 1
                                            activeState = nil
                                            translation = .zero
                                            if currentIndex >= users.count {
                                                currentIndex = 0
                                            }
                                        }
                                    } else {
                                        translation = .zero
                                        activeState = nil
                                    }
                                }
                            }
                        : nil
                    )
                    .zIndex(Double(users.count - index))
                    .padding(.bottom, 33)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ForEach(menus, id: \.id) { menu in
                        Button(action: {
                            handleMenuAction(menu: menu)
                        }) {
                            Image(systemName: menu.image)
                                .font(.system(size: 22, weight: .heavy))
                                .foregroundColor(menu.color)
                                .frame(width: menu.height, height: menu.height)
                                .themeButtonBackground()
                                .cornerRadius(menu.height / 2)
                                .lightShadow()
                        }
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 5)
                .background(Color.clear)
                .cornerRadius(15)
                .padding(.horizontal)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .zIndex(.infinity)
        }
    }
    
    private func handleMenuAction(menu: HomeMenu) {
        switch menu.id {
        case 1:
            withAnimation(.easeInOut(duration: 0.6)) {
                translation = CGSize(width: UIScreen.main.bounds.width, height: 0)
                activeState = .nope
            }
        case 3:
            withAnimation(.easeInOut(duration: 0.6)) {
                translation = CGSize(width: -UIScreen.main.bounds.width, height: 0)
                activeState = .like
            }
        case 2:
            withAnimation(.easeInOut(duration: 0.6)) {
                translation = CGSize(width: 0, height: -UIScreen.main.bounds.height)
                activeState = .superlike
            }
        default:
            break
        }
        performSwipeAction(afterDelay: 0.4)
    }
    
    private func performSwipeAction(afterDelay delay: Double = 0.0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            withAnimation(.easeInOut(duration: 0.6)) {
                currentIndex += 1
                activeState = nil
                translation = .zero
                if currentIndex >= users.count {
                    currentIndex = 0
                }
            }
        }
    }
}


struct HomeMenu {
    let id: Int
    let image: String
    let color: Color
    let height: CGFloat
    
    static let menus = [
        HomeMenu(id: 0,
                 image: "arrow.counterclockwise",
                 color: Color(UIColor(red: 247/255, green: 181/255, blue: 50/255, alpha: 1)),
                 height: 47),
        HomeMenu(id: 1,
                 image: "xmark",
                 color: Color.pinkishRed,
                 height: 55),
        HomeMenu(id: 2,
                 image: "star.fill",
                 color: Color(UIColor(red: 38/255, green: 172/255, blue: 250/255, alpha: 1)),
                 height: 47),
        HomeMenu(id: 3,
                 image: "suit.heart.fill",
                 color: Color(UIColor(red: 117/255, green: 205/255, blue: 53/255, alpha: 1)),
                 height: 55),
        HomeMenu(id: 4,
                 image: "bolt.fill",
                 color: .purple,
                 height: 47)
    ]
}

#Preview {
    HomeView()
}
