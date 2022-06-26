//
//  TodoView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/06.
//

import SwiftUI

struct TodoView: View {
    let todo: Todo
    
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
    }
}

struct TodoView_Previews: PreviewProvider {
    static let comments = [
        Comment(content: "comment"),
        Comment(content: "content")
    ]
    static let todo = Todo(title: "title", comments: comments)
    static var previews: some View {
        TodoView(todo: todo)
    }
}
