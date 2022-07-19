//
//  DailyScrum.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/05.
//

import Foundation

struct DailyScrum: Identifiable {
    let id = UUID()
    var title: String
    var attendees: [String]
    var lengthInMinutes: Double
    var theme: Theme
}
