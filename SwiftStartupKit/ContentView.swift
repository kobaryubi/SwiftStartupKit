//
//  ContentView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/04.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dailyScrumStore = DailyScrumStore()
    
    var body: some View {
        VStack {
            NavigationLink(
                destination: DailyScrumsView(
                    dailyScrums: $dailyScrumStore.dailyScrums
                ) {
                    Task {
                        do {
                            try await DailyScrumStore.save(dailyScrums: dailyScrumStore.dailyScrums)
                        } catch {
                            fatalError("Error saving daily scrums.")
                        }
                    }
                }
            ) {
                Label("Daily Scrums", systemImage: "person")
            }
            .navigationTitle("Menu")
            .task {
                do {
                    dailyScrumStore.dailyScrums = try await DailyScrumStore.load()
                } catch {
                    fatalError("Error loading scrums.")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
