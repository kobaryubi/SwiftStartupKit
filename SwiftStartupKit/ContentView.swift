//
//  ContentView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationLink(destination: TodosView()) {
            Label("Todos", systemImage: "list.bullet")
        }
        .navigationTitle("Menu")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
