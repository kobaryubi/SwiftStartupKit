//
//  TodosView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/23.
//

import SwiftUI

struct TodosView: View {
    @Binding var todos: [Todo]
    
    var body: some View {
        List {
            ForEach($todos) { $todo in
                NavigationLink(destination: TodoView(todo: $todo)) {
                    TodoCardView()
                }
            }
        }
        .navigationTitle("Todos")
    }
}

struct TodosView_Previews: PreviewProvider {
    static var todos = [
        Todo(title: "title", lengthInMinutes: 1, comments: [Comment(content: "content")], theme: .buttercup),
        Todo(title: "title", lengthInMinutes: 1, comments: [Comment(content: "content")], theme: .buttercup),
        Todo(title: "title", lengthInMinutes: 1, comments: [Comment(content: "content")], theme: .buttercup),
    ]
    static var previews: some View {
        NavigationView {
            TodosView(todos: .constant(todos))
        }
    }
}
