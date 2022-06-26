//
//  TodosView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/23.
//

import SwiftUI

struct TodosView: View {
    private var todos = [
        Todo(title: "title 1"),
        Todo(title: "title 2"),
        Todo(title: "title 3"),
        Todo(title: "title 4"),
        Todo(title: "title 5"),
    ]
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                NavigationLink(destination: TodoView()) {
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
