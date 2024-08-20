//
//  User.swift
//  example
//
//  Created by Nemo on 19/8/24.
//

import Foundation

struct User: Identifiable {
    let id: UUID = UUID()
    let name: String
    let age: Int
    let desc: String
    let images: [String]
    var location: String = "Ha Noi"
    
    static let users: [User] = [
        User(name: "Wall E", age: 2008, desc: "ABCXYZ", images: ["img_wall_e", "img_wall_e_1", "img_wall_e_2", "img_wall_e_3"], location: "Pixar"),
        User(name: "Frozen", age: 2013, desc: "ABCXYZ", images: ["frozen_0", "frozen_1", "frozen_2", "frozen_3"], location: "Disney"),
        User(name: "Up", age: 2009, desc: "ABCXYZ", images: ["up_0", "up_1", "up_2", "up_3"], location: "Pixar"),
        User(name: "The Book of Life", age: 2014, desc: "ABCXYZ", images: ["book_0", "book_1", "book_2"], location: "20th Century Fox"),
    ]
    
}
