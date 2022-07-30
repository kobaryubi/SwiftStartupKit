//
//  DailyScrumMeetingView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/20.
//

import SwiftUI

struct DailyScrumMeetingView: View {
    @Binding var dailyScrum: DailyScrum
    @StateObject var dailyScrumTimer = DailyScrumTimer()

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(dailyScrum.theme.mainColor)
            VStack {
                DailyScrumMeetingHeaderView(
                    secondsElapsed: dailyScrumTimer.secondsElapsed,
                    secondsRemaining: dailyScrumTimer.secondsRemaining,
                    theme: dailyScrum.theme
                )
                Circle()
                    .strokeBorder(lineWidth: 24)
                DailyScrumMeetingFooterView(
                    speakers: dailyScrumTimer.speakers,
                    skipAction: dailyScrumTimer.skipSpeaker
                )
            }
        }
        .padding()
        .foregroundColor(dailyScrum.theme.accentColor)
        .onAppear {
            dailyScrumTimer.reset(
                lengthInMinutes: Int(dailyScrum.lengthInMinutes),
                attendees: dailyScrum.attendees
            )
            dailyScrumTimer.start()
        }
        .onDisappear {
            dailyScrumTimer.stop()
            let newHistory = DailyScrumHistory(
                attendees: dailyScrum.attendees,
                lengthInMinutes: Double(dailyScrumTimer.secondsElapsed / 60)
            )
            dailyScrum.history.insert(newHistory, at: 0)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DailyScrumMeetingView_Previews: PreviewProvider {
    static let dailyScrum = DailyScrum(
        title: "Design",
        attendees: ["A", "B"],
        lengthInMinutes: 5.0,
        theme: .buttercup
    )
    static var previews: some View {
        DailyScrumMeetingView(dailyScrum: .constant(dailyScrum))
    }
}
