//
//  TodoThemePickerView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/13.
//

import SwiftUI

struct TodoThemePickerView: View {
    @Binding var selection: TodoTheme

    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(TodoTheme.allCases) { todoTheme in
                TodoThemeView(todoTheme: todoTheme)
                    .tag(todoTheme)
            }
        }
    }
}

struct TodoThemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TodoThemePickerView(selection: .constant(.buttercup))
    }
}
