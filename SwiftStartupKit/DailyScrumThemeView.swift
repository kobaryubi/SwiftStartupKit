//
//  DailyScrumThemeView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/21.
//

import SwiftUI

struct DailyScrumThemeView: View {
    let theme: DailyScrumTheme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(theme.mainColor)
            Label(theme.name, systemImage: "paintpalette")
                .padding(4)
        }
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct DailyScrumThemeView_Previews: PreviewProvider {
    static var previews: some View {
        DailyScrumThemeView(theme: .buttercup)
    }
}
