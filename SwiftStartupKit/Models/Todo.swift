//
//  Todo.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/23.
//

import Foundation

struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var lengthInMinutes: Double
    var comments: [TodoComment]
    var theme: Theme
}
