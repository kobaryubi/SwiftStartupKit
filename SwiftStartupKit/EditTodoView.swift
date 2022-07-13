//
//  EditTodoView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/27.
//

import SwiftUI

struct EditTodoView: View {
    @State private var todo = Todo(
        title: "",
        lengthInMinutes: 5,
        comments: [
            Comment(content: "comment"),
            Comment(content: "comment")
        ],
        theme: .buttercup
    )
    @State private var newCommentContent = ""

    var body: some View {
        Form {
            Section(header: Text("Detail")) {
                TextField("Title", text: $todo.title)
                HStack {
                    Slider(value: $todo.lengthInMinutes, in: 5...30, step: 1)
                    Spacer()
                    Text("\(Int(todo.lengthInMinutes)) minutes")
                }
                TodoThemePickerView(selection: $todo.theme)
            }
            Section(header: Text("Comments")) {
                ForEach(todo.comments) { comment in
                    Text(comment.content)
                }
                .onDelete { indices in
                    todo.comments.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Comment", text: $newCommentContent   )
                    Button(action: {
                        withAnimation {
                            let comment = Comment(content: newCommentContent)
                            todo.comments.append(comment)
                            newCommentContent = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newCommentContent.isEmpty)
                }
            }
        }
    }
}

struct EditTodoView_Previews: PreviewProvider {
    static var previews: some View {
        EditTodoView()
    }
}
