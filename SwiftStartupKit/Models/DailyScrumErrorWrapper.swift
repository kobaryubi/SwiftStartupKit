//
//  DailyScrumErrorWrapper.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/31.
//

import Foundation

struct DailyScrumErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
