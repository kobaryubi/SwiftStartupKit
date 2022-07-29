//
//  DailyScrumMeetingHeaderView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/21.
//

import SwiftUI

struct DailyScrumMeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: DailyScrumTheme
    
    private var progress: Double {
        let totalSeconds = secondsElapsed + secondsRemaining
        guard totalSeconds > 0 else { return 1 }
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

struct DailyScrumMeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DailyScrumMeetingHeaderView(
            secondsElapsed: 60,
            secondsRemaining: 180,
            theme: .bubblegum
        )
            .previewLayout(.sizeThatFits)
    }
}
