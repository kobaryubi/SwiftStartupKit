//
//  DailyScrumCardView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/20.
//

import SwiftUI

struct DailyScrumCardView: View {
    let dailyScrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(dailyScrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(dailyScrum.attendees.count)", systemImage: "person.3")
                Spacer()
                Label("\(Int(dailyScrum.lengthInMinutes))", systemImage: "clock")
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(dailyScrum.theme.accentColor)
    }
}

struct DailyScrumCardView_Previews: PreviewProvider {
    static let dailyScrum = DailyScrum(
        title: "title",
        attendees: ["A", "B", "C"],
        lengthInMinutes: 5,
        theme: .buttercup
    )
    
    static var previews: some View {
        DailyScrumCardView(dailyScrum: dailyScrum)
            .background(dailyScrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
