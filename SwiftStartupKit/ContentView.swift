//
//  ContentView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/04.
//

import SwiftUI

struct ContentView: View {
    @State private var todos: [Todo] = [
        Todo(title: "title", lengthInMinutes: 5, comments: [
            Comment(content: "comment"),
            Comment(content: "comment")
        ], theme: .buttercup),
        Todo(title: "title", lengthInMinutes: 5, comments: [
            Comment(content: "comment"),
            Comment(content: "comment")
        ], theme: .buttercup)
    ]
    
    var body: some View {
        NavigationLink(destination: TodosView(todos: $todos)) {
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
