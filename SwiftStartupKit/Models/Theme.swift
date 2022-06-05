//
//  Theme.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/05.
//

import SwiftUI

enum Theme: String {
    case sky
    case navy
    
    var accentColor: Color {
        switch self {
            case .sky: return .black
            case .navy: return .white
        }
    }

    var mainColor: Color {
        Color(rawValue)
    }
}
