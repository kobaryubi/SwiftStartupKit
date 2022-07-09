//
//  TodoView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/06.
//

import SwiftUI

struct TodoView: View {
    let todo: Todo
    
    @State private var isPresentingEditTodoView = false
    
    var body: some View {
        List {
            Section(header: Text("Detail")) {
                Text(todo.title)
            }
            Section(header: Text("Comments")) {
                ForEach(todo.comments) { comment in
                    Label(comment.content, systemImage: "bubble.right")
                }
            }
        }
        .navigationTitle(todo.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditTodoView = true
            }
        }
        .sheet(isPresented: $isPresentingEditTodoView) {
            NavigationView {
                EditTodoView()
                    .navigationTitle(todo.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditTodoView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditTodoView = false
                            }
                        }
                    }
            }
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static let comments = [
        Comment(content: "comment"),
        Comment(content: "comment")
    ]
    static let todo = Todo(title: "title", lengthInMinutes: 5, comments: comments)
    static var previews: some View {
        NavigationView {
            TodoView(todo: todo)
        }
    }
}
