//
//  TodoView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/06.
//

import SwiftUI

struct TodoView: View {
    @Binding var todo: Todo
    
    @State private var isPresentingEditTodoView = false
    
    var body: some View {
        List {
            Section(header: Text("Todo Info")) {
                HStack {
                    Label("Title", systemImage: "star")
                    Spacer()
                    Text(todo.title)
                }
                NavigationLink(destination: TodoTimerView(todo: $todo)) {
                    Label("Start Todo", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(Int(todo.lengthInMinutes)) minutes")
                }
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(todo.theme.name)
                        .padding(4)
                        .foregroundColor(todo.theme.accentColor)
                        .background(todo.theme.mainColor)
                        .cornerRadius(4)                    
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
                EditTodoView(todo: $todo)
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
    static let todo = Todo(title: "title", lengthInMinutes: 5, comments: comments, theme: .buttercup)
    static var previews: some View {
        NavigationView {
            TodoView(todo: .constant(todo))
        }
    }
}
