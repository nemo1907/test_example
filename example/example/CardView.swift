//
//  CardView.swift
//  example
//
//  Created by Nemo on 19/8/24.
//

import SwiftUI

struct CardView: View {
    var user: User
    @Binding var translation: CGSize
    @Binding var activeState: CardState?
    @State private var currentImageIndex = 0
    
    enum CardState {
        case like, nope, superlike
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                if !user.images.isEmpty {
                    Image(user.images[currentImageIndex])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                        .cornerRadius(15)
                        .overlay(
                            VStack {
                                HStack(spacing: 3) {
                                    ForEach(0..<user.images.count, id: \.self) { index in
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(index == currentImageIndex ? Color.white : Color.gray)
                                            .frame(width: geo.size.width / CGFloat(user.images.count) - 6, height: 4)
                                    }
                                }
                                .padding(.top, 8)
                                
                                Spacer()
                            }
                                .padding(.horizontal, 8)
                                .padding(.top, 8),
                            alignment: .topLeading
                        )
                    
                    HStack(spacing: 0) {
                        Color.clear
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    currentImageIndex = max(currentImageIndex - 1, 0)
                                }
                            }
                        Color.clear
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    currentImageIndex = min(currentImageIndex + 1, user.images.count - 1)
                                }
                            }
                    }
                    
                    ZStack {
                        VStack {
                            HStack {
                                if activeState == .like {
                                    Text("LIKE")
                                        .font(.title3)
                                        .foregroundColor(.green)
                                        .padding(12)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Spacer()
                                } else if activeState == .nope {
                                    Spacer()
                                    Text("NOPE")
                                        .font(.title3)
                                        .foregroundColor(.red)
                                        .padding(12)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            }
                            .padding(.horizontal, 16)
                            Spacer()
                            if activeState == .superlike {
                                Text("SUPER LIKE")
                                    .font(.title3)
                                    .foregroundColor(.blue)
                                    .padding(12)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .frame(maxWidth: .infinity, alignment: .bottom)
                            }
                        }
                        .padding(.top, 40)
                        .padding(.bottom, 40)
                        VStack {
                            Spacer()
                            CardInfoView(user: user)
                        }
                    }
                }
            }
            .offset(x: translation.width, y: translation.height)
            .rotationEffect(.degrees(Double(translation.width / geo.size.width) * 25), anchor: .bottom)
            .cornerRadius(15)
        }
    }
}


struct CardInfoView: View {
    let user: User
    var body: some View {
        VStack(spacing: 8) {
            infoHeader
            userDetails
            locationInfo
        }
        .foregroundColor(.white)
        .padding()
        .padding(.bottom, 25)
        .background(gradientBackground)
        .cornerRadius(15)
        .clipped()
    }
    
    private var infoHeader: some View {
        HStack(alignment: .bottom) {
            VStack(spacing: 4) {
                locationTag
                userNameAndAge
            }
            Spacer()
            Image(systemName: "arrow.up")
                .font(.system(size: 18))
                .foregroundColor(.white)
                .padding(8)
                .background(Circle().fill(Color.black.opacity(0.6)))
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 1)
                )
        }
    }
    
    private var locationTag: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 14, height: 16)
            Text("Nearby")
                .font(.system(size: 14, weight: .bold))
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
        .background(Color(red: 16/255, green: 119/255, blue: 119/255))
        .cornerRadius(20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var userNameAndAge: some View {
        HStack {
            Text(user.name)
                .font(.system(size: 30))
                .fontWeight(.bold)
            Text(" \(user.age)")
                .font(.system(size: 29))
                .fontWeight(.regular)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var userDetails: some View {
        Text(user.desc)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var locationInfo: some View {
        VStack(spacing: 5) {
            HStack(alignment: .center) {
                Image(systemName: "house.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text("Lives in \(user.location)")
                    .font(.system(size: 14, weight: .bold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(alignment: .center) {
                Image(systemName: "mappin.and.ellipse")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text("19 km away")
                    .font(.system(size: 14, weight: .bold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var gradientBackground: some View {
        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.9), .clear]),
                       startPoint: .bottom,
                       endPoint: .top)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleUser = User(name: "Test", age: 33, desc: "ABCXYZ", images: ["img_wall_e", "img_wall_e_1", "img_wall_e_2"])
        
        @State var translation: CGSize = .zero
        @State var activeState: CardView.CardState? = nil
        
        return CardView(user: sampleUser, translation: $translation, activeState: $activeState)
            .frame(height: 400)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
