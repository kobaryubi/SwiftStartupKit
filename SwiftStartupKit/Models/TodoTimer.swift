//
//  TodoTimer.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/07/16.
//

import Foundation

class TodoTimer: ObservableObject {
    @Published var secondsElapsed = 0
    @Published var secondsRemaining = 0
    
    private(set) var lengthInMinutes: Int = 0
    private var lengthInSeconds: Int {
        lengthInMinutes * 60
    }
    private var timer: Timer?
    private static let frequency: TimeInterval = 1.0 / 60.0
    private var startDate: Date?
    
    /**
     Start the timer.
     */
    func startTimer() {
        startDate = Date()
        timer = Timer.scheduledTimer(withTimeInterval: TodoTimer.frequency, repeats: true) { [weak self] timer in
            guard let self = self, let startDate = self.startDate else {
                return
            }

            let secondsElapsed = Date().timeIntervalSince1970 - startDate.timeIntervalSince1970
            self.secondsElapsed = Int(secondsElapsed)
        }
    }
    
    /**
     Reset the todo timer with a new todo length.
     - Parameters:
        - lengthInMinutes: The todo length.
     */
    func reset(lengthInMinutes: Int) {
        self.lengthInMinutes = lengthInMinutes
        secondsRemaining = lengthInSeconds
    }
    
    /**
     Stop the todo timer.
     */
    func stopTimer() {
        guard let timer = self.timer else {
            return
        }
        
        timer.invalidate()
        self.timer = nil
    }
}
