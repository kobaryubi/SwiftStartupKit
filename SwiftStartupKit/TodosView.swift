//
//  TodosView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/23.
//

import SwiftUI

struct TodosView: View {
    private var todos = [
        Todo(title: "title", lengthInMinutes: 5, comments: [Comment(content: "content")]),
        Todo(title: "title", lengthInMinutes: 5, comments: [Comment(content: "content")]),
        Todo(title: "title", lengthInMinutes: 5, comments: [Comment(content: "content")]),
    ]
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                NavigationLink(destination: TodoView(todo: todo)) {
                    TodoCardView()
                }
            }
        }
        .navigationTitle("Todos")
    }
}

struct TodosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodosView()
        }
    }
}
