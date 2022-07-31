//
//  DailyScrumsView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/19.
//

import SwiftUI

struct DailyScrumsView: View {
    @Binding var dailyScrums: [DailyScrum]
    @State private var isPresentingNewDailyScrumView = false
    @State private var newDailyScrum = DailyScrum(
        title: "", attendees: [], lengthInMinutes: 5.0, theme: .buttercup
    )
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    
    var body: some View {
        List {
            ForEach($dailyScrums) { $dailyScrum in
                NavigationLink(destination: DailyScrumView(dailyScrum: $dailyScrum)) {
                    DailyScrumCardView(dailyScrum: dailyScrum)
                }
                .listRowBackground(dailyScrum.theme.mainColor)
                
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: {
                isPresentingNewDailyScrumView = true
            }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $isPresentingNewDailyScrumView) {
            NavigationView {
                EditDailyScrumView(dailyScrum: $newDailyScrum)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewDailyScrumView = false
                                newDailyScrum = DailyScrum(
                                    title: "",
                                    attendees: [],
                                    lengthInMinutes: 5,
                                    theme: .seafoam
                                )
                                
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                dailyScrums.append(newDailyScrum)
                                isPresentingNewDailyScrumView = false
                                newDailyScrum = DailyScrum(
                                    title: "",
                                    attendees: [],
                                    lengthInMinutes: 5,
                                    theme: .seafoam
                                )
                            }
                        }
                    }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                saveAction()
            }
        }
    }
}

struct DailyScrumsView_Previews: PreviewProvider {
    static var dailyScrums = [
        DailyScrum(
            title: "Design", attendees: ["A", "B", "C"], lengthInMinutes: 5.0, theme: .buttercup
        ),
        DailyScrum(
            title: "App Dev", attendees: ["A", "B", "C"], lengthInMinutes: 5.0, theme: .buttercup
        ),
        DailyScrum(
            title: "Web Dev", attendees: ["A", "B", "C"], lengthInMinutes: 5.0, theme: .buttercup
        )
    ]
    
    static var previews: some View {
        NavigationView {
            DailyScrumsView(
                dailyScrums: .constant(dailyScrums),
                saveAction: {}
            )
        }
    }
}
