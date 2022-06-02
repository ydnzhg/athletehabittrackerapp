//
//  WorkoutInfo.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 6/1/22.
//

import Foundation

struct WorkoutInfo {
    // 1 for completed, 0 for did not complete
    var completed: Int
    // 0 for upper, 1 for lower
    var bodyPart: Int
    var sets: Int
    var intensity: Double
    var pain: Double
    
    init(completed: Int, bodyPart: Int, sets: Int, intensity: Double, pain: Double) {
        self.completed = completed
        self.bodyPart = bodyPart
        self.sets = sets
        self.intensity = intensity
        self.pain = pain
    }
}

extension WorkoutInfo {
    static let blankSampleData: WorkoutInfo = WorkoutInfo(completed: 0, bodyPart: 0, sets: 0, intensity: 0, pain: 0)
}
