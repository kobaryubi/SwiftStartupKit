//
//  TodoTimerHeaderView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/16.
//

import SwiftUI

struct TodoTimerHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let todoTheme: TodoTheme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    private var progress: Double {
        guard totalSeconds > 0 else {
            return 1
        }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                }
            }
        }
        .padding([.top, .horizontal])
    }
}

struct TodoTimerHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TodoTimerHeaderView(secondsElapsed: 60, secondsRemaining: 180, todoTheme: .bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
