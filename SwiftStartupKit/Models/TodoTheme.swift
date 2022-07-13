//
//  TodoTheme.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/10.
//

import SwiftUI

enum TodoTheme: String, CaseIterable, Identifiable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var accentColor: Color {
        switch self {
            case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
            case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
}
