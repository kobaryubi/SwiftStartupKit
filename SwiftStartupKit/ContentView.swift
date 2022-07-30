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
                    DailyScrumStore.save(
                        dailyScrums: dailyScrumStore.dailyScrums
                    ) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            ) {
                Label("Daily Scrums", systemImage: "person")
            }
            .navigationTitle("Menu")
            .onAppear {
                DailyScrumStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let dailyScrums):
                        dailyScrumStore.dailyScrums = dailyScrums
                    }
                    
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
