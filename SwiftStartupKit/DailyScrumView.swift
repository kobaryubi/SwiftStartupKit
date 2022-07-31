//
//  DailyScrumView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/19.
//

import SwiftUI

struct DailyScrumView: View {
    @Binding var dailyScrum: DailyScrum
    @State private var isPresentingEditDailyScrumView = false
    
    var body: some View {
        List {
            Section(header : Text("Meeting Info")) {
                NavigationLink(destination: DailyScrumMeetingView(dailyScrum: $dailyScrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(Int(dailyScrum.lengthInMinutes)) minutes")
                }
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(dailyScrum.theme.name)
                        .padding(4)
                        .foregroundColor(dailyScrum.theme.accentColor)
                        .background(dailyScrum.theme.mainColor)
                        .cornerRadius(4)
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(dailyScrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            Section(header: Text("History")) {
                if dailyScrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(dailyScrum.history) { history in
                    HStack {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    }
                }
            }
        }
        .navigationTitle(dailyScrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditDailyScrumView = true
            }
        }
        .sheet(isPresented: $isPresentingEditDailyScrumView) {
            NavigationView {
                EditDailyScrumView(
                    dailyScrum: $dailyScrum
                )
                    .navigationTitle(dailyScrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditDailyScrumView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditDailyScrumView = false
                            }
                        }
                    }
            }
        }
    }
}

struct DailyScrumView_Previews: PreviewProvider {
    static let dailyScrum = DailyScrum(
        title: "Design",
        attendees: ["A", "B", "C"],
        lengthInMinutes: 5.0,
        theme: .sky
    )
    
    static var previews: some View {
        NavigationView {
            DailyScrumView(dailyScrum: .constant(dailyScrum))
        }
    }
}
