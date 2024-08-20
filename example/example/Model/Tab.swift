//
//  Tab.swift
//  example
//
//  Created by Nemo on 20/8/24.
//

import SwiftUI

struct Tab {
    let id: Int
    let name: String
    let color: Color
    let image: String
    
    static let tabs = [
        Tab(id: 0, name: "home", color: .pinkishRed, image: "flame.fill"),
        Tab(id: 1, name: "like", color: .gold, image: "wand.and.stars"),
        Tab(id: 2, name: "message", color: .pinkishRed, image: "message.fill"),
        Tab(id: 3, name: "profile", color: .pinkishRed, image: "person.fill")
    ]
}
