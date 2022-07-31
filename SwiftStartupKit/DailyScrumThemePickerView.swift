//
//  DailyScrumThemePickerView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/21.
//

import SwiftUI

struct DailyScrumThemePickerView: View {
    @Binding var selection: DailyScrumTheme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(DailyScrumTheme.allCases) { theme in
                DailyScrumThemeView(theme: theme)
                    .tag(theme)
            }
        }
    }
}

struct DailyScrumThemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DailyScrumThemePickerView(selection: .constant(.buttercup))
    }
}
