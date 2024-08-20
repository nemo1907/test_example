//
//  Modifiers.swift
//  example
//
//  Created by Nemo on 19/8/24.
//

import SwiftUI

struct ThemeButtonBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.white)
    }
}

struct LightShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.1), radius: 4)
    }
}

extension View {
    func themeButtonBackground() -> some View {
        self.modifier(ThemeButtonBackground())
    }
    
    func lightShadow() -> some View {
        self.modifier(LightShadow())
    }
}
