//
//  DailyScrumHistory.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/19.
//

import Foundation

struct DailyScrumHistory: Identifiable, Codable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrumAttendee]
    var lengthInMinutes: Double
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrumAttendee], lengthInMinutes: Double = 5.0) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
    }
}
