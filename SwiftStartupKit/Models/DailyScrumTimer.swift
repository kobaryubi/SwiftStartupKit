//
//  DailyScrumTimer.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/21.
//

import Foundation

class DailyScrumTimer: ObservableObject {
    struct Speaker: Identifiable {
        let name: String
        var isCompleted: Bool
        let id = UUID()
    }
    
    @Published var secondsElapsed = 0
    @Published var secondsRemaining = 0
    @Published var activeSpeaker = ""
    
    private(set) var lengthInMinutes: Int = 0
    private var lengthInSeconds: Int { lengthInMinutes * 60 }
    private(set) var speakers: [Speaker] = []
    private var speakerIndex: Int = 0
    private var speakerText: String {
        return "Speaker \(speakerIndex + 1): \(speakers[speakerIndex].name)"
    }
    private var secondsElapsedForSpeaker: Int = 0
    private var secondsPerSpeaker: Int {
        (lengthInMinutes * 60) / speakers.count
    }
    private var startDate: Date?
    private var timer: Timer?
    private let frequency: TimeInterval = 1.0 / 60.0
    private var timerStopped = false
    
    /**
     Reset the timer with a new meeting length and new attendees.
     
     - Parameters:
        - lengthInMinutes: The meeting length.
        - attendees: The name of each attendees.
     */
    func reset(lengthInMinutes: Int, attendees: [DailyScrumAttendee]) {
        self.lengthInMinutes = lengthInMinutes
        secondsRemaining = lengthInSeconds
        speakers = attendees.isEmpty ?
        [DailyScrumTimer.Speaker(name: "Speaker 1", isCompleted: false)] :
        attendees.map { DailyScrumTimer.Speaker(name: $0.name, isCompleted: false) }
        activeSpeaker = speakerText
    }
    
    /**
     Start the timer
     */
    func start() {
        changeToSpeaker(at: 0)
    }
    
    private func changeToSpeaker(at index: Int) {
        if index > 0 {
            let previousSpeakerIndex = index - 1
            speakers[previousSpeakerIndex].isCompleted = true
        }
        secondsElapsedForSpeaker = 0
        guard index < speakers.count else { return }
        
        speakerIndex = index
        activeSpeaker = speakerText
        secondsElapsed = index * secondsPerSpeaker
        secondsRemaining = lengthInSeconds - secondsElapsed
        startDate = Date()
        timer = Timer.scheduledTimer(
            withTimeInterval: frequency,
            repeats: true
        ) { [weak self] timer in
            guard let self = self, let startDate = self.startDate else {
                return
            }
            
            let secondsElapsed = Date().timeIntervalSince1970 - startDate.timeIntervalSince1970
            self.update(secondsElapsed: Int(secondsElapsed))
        }
    }

    private func update(secondsElapsed: Int) {
        secondsElapsedForSpeaker = secondsElapsed
        self.secondsElapsed = secondsPerSpeaker * speakerIndex + secondsElapsedForSpeaker
        guard secondsElapsed <= secondsPerSpeaker else {
            return
        }
        
        secondsRemaining = max(lengthInSeconds - self.secondsElapsed, 0)
        guard !timerStopped else { return }
        
        guard secondsElapsedForSpeaker >= secondsPerSpeaker else {
            return
        }
        
        changeToSpeaker(at: speakerIndex + 1)
    }
    
    /**
     Stop the timer
     */
    func stop() {
        timer?.invalidate()
        timer = nil
        timerStopped = true
    }
    
    func skipSpeaker() {
        changeToSpeaker(at: speakerIndex + 1)
    }
}

//    /**
//     Initialize a new timer. Initializing a time with no arguments creates a ScrumTimer with no attendees and zero length.
//     Use `startScrum()` to start the timer.
//
//     - Parameters:
//        - lengthInMinutes: The meeting length.
//        -  attendees: A list of attendees for the meeting.
//     */
//    init(lengthInMinutes: Int = 0, attendees: [DailyScrum.Attendee] = []) {
//        self.lengthInMinutes = lengthInMinutes
//        self.speakers = attendees.speakers
//        secondsRemaining = lengthInSeconds
//        activeSpeaker = speakerText
//    }
//
//extension DailyScrum {
//    /// A new `ScrumTimer` using the meeting length and attendees in the `DailyScrum`.
//    var timer: ScrumTimer {
//        ScrumTimer(lengthInMinutes: lengthInMinutes, attendees: attendees)
//    }
//}
