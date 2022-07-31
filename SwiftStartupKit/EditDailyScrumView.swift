//
//  EditDailyScrumView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/21.
//

import SwiftUI

struct EditDailyScrumView: View {
    @Binding var dailyScrum: DailyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $dailyScrum.title)
                HStack {
                    Slider(value: $dailyScrum.lengthInMinutes, in: 5...30, step: 1)
                    Spacer()
                    Text("\(Int(dailyScrum.lengthInMinutes)) minutes")
                }
                DailyScrumThemePickerView(selection: $dailyScrum.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(dailyScrum.attendees) {
                    attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    dailyScrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let dailyScrumAttendee = DailyScrumAttendee(name: newAttendeeName)
                            dailyScrum.attendees.append(dailyScrumAttendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct EditDailyScrumView_Previews: PreviewProvider {
    static let dailyScrum = DailyScrum(title: "Design", attendees: ["A", "B", "C"], lengthInMinutes: 5.0, theme: .sky)
    
    static var previews: some View {
        EditDailyScrumView(dailyScrum: .constant(dailyScrum))
    }
}
