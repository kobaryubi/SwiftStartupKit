//
//  DailyScrumHistory.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/19.
//

import Foundation

struct DailyScrumHistory: Identifiable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrumAttendee]
    var lengthInMinutes: Double
}
