//
//  TodoThemeView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/10.
//

import SwiftUI

struct TodoThemeView: View {
    let todoTheme: TodoTheme
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(todoTheme.mainColor)
            Label(todoTheme.name, systemImage: "paintpalette")
                .padding(4)
        }
        .foregroundColor(todoTheme.accentColor)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct TodoThemeView_Previews: PreviewProvider {
    static var previews: some View {
        TodoThemeView(todoTheme: .buttercup)
    }
}
