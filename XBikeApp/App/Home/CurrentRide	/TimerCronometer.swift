//
//  Timer.swift
//  XBikeApp
//
//  Created by leonard Borrego on 21/08/22.
//

import Foundation
import SwiftUI

final class TimerCronometer: ObservableObject {
    @Published var minutes: Int = 0
    @Published var hours: Int = 0
    @Published var seconds: Int = 0
    var delegate: MakeRideDelegate
    
    init(delegate: MakeRideDelegate) {
        self.delegate = delegate
    }
    
    var timer: Timer?
    
    func startTimer(){
        // 1. Make a new timer
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            self.delegate.drawingPoint()
            if self.seconds == 59 {
                self.seconds = 0
                if self.minutes == 59 {
                    self.minutes = 0
                    self.hours = self.hours + 1
                } else {
                    self.minutes = self.minutes + 1
                }
            } else {
                self.seconds = self.seconds + 1
            }
        }
    }
    
    func reset() {
        self.hours = 0
        self.minutes = 0
        self.seconds = 0
    }
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
}
