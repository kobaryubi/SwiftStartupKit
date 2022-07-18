//
//  TodoTimerView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/16.
//

import SwiftUI

struct TodoTimerView: View {
    @Binding var todo: Todo
    @StateObject var todoTimer = TodoTimer()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(todo.theme.mainColor)
            VStack {
                TodoTimerHeaderView(secondsElapsed: todoTimer.secondsElapsed, secondsRemaining: todoTimer.secondsRemaining, todoTheme: todo.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
            }
        }
        .padding()
        .foregroundColor(todo.theme.accentColor)
        .onAppear {
            todoTimer.reset(lengthInMinutes: Int(todo.lengthInMinutes))
            todoTimer.startTimer()
        }
        .onDisappear {
            todoTimer.stopTimer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TodoTimerView_Previews: PreviewProvider {
    static let todo = Todo(
        title: "",
        lengthInMinutes: 5,
        comments: [
            Comment(content: "comment"),
            Comment(content: "comment"),
        ],
        theme: .buttercup
    )

    static var previews: some View {
        TodoTimerView(todo: .constant(todo))
    }
}
