//
//  DailyScrumAttendee.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/20.
//

import Foundation

struct DailyScrumAttendee: Identifiable, Codable {
    let id: UUID
    var name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
