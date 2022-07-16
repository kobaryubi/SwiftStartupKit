//
//  TodoTimerView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/16.
//

import SwiftUI

struct TodoTimerView: View {
    @Binding var todo: Todo
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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








////
////  MeetingView.swift
////  SwiftStartupKit
////
////  Created by Masahiko Kobayashi on 2022/06/05.
////
//
//import SwiftUI
//
//struct MeetingView: View {
//    var body: some View {
//        VStack {
//            ProgressView(value: 5, total: 15)
//            HStack {
//                VStack(alignment: .leading) {
//                    Text("Seconds Elapsed").font(.caption)
//                    Label("300", systemImage: "hourglass.bottomhalf.fill")
//                }
//                Spacer()
//                VStack(alignment: .trailing) {
//                    Text("Seconds Remaining").font(.caption)
//                    Label("600", systemImage: "hourglass.tophalf.fill")
//                }
//            }
//            Circle().strokeBorder(lineWidth: 24)
//            HStack{
//                Text("Speaker 1 of 3")
//                Spacer()
//                Button(action: {}) {
//                    Image(systemName: "forward.fill")
//                }
//            }
//        }.padding()
//    }
//}
//
//struct MeetingView_Previews: PreviewProvider {
//    static var previews: some View {
//        MeetingView()
//    }
//}
