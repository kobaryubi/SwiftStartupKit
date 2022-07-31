//
//  DailyScrumMeetingFooterView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/21.
//

import SwiftUI

struct DailyScrumMeetingFooterView: View {
    let speakers: [DailyScrumTimer.Speaker]
    var skipAction: () -> Void
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }

    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct DailyScrumMeetingFooterView_Previews: PreviewProvider {
    static let speakers = [
        DailyScrumTimer.Speaker(name: "A", isCompleted: true),
        DailyScrumTimer.Speaker(name: "B", isCompleted: false),
        DailyScrumTimer.Speaker(name: "C", isCompleted: false),
    ]
    static var previews: some View {
        DailyScrumMeetingFooterView(
            speakers: speakers,
            skipAction: {}
        )
        .previewLayout(.sizeThatFits)
    }
}
