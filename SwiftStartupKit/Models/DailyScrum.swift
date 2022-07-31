//
//  DailyScrum.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/05.
//

import Foundation

struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [DailyScrumAttendee]
    var lengthInMinutes: Double
    var theme: DailyScrumTheme
    var history: [DailyScrumHistory] = []
    
    init(
        id: UUID = UUID(),
        title: String,
        attendees: [String],
        lengthInMinutes: Double,
        theme: DailyScrumTheme
    ) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { DailyScrumAttendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}
