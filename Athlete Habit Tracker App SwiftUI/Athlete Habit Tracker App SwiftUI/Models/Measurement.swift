//
//  Measurement.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/30/22.
//

import Foundation

struct Measurement: Identifiable {
    let id: UUID
    var title: String
    var goal: Int
    var units: String
    var shortUnits: String
    var icon: String
    var lastWeek: [Int]
    var palette: Palette
    
    init(id: UUID = UUID(), title: String, goal: Int, units: String, shortUnits: String, icon: String, lastWeek: [Int], palette: Palette) {
        self.id = id
        self.title = title
        self.goal = goal
        self.units = units
        self.shortUnits = shortUnits
        self.icon = icon
        self.lastWeek = lastWeek
        self.palette = palette
    }
}

extension Measurement {
    struct Data {
        var title: String = ""
        var goal: Int = 15
        var units: String = ""
        var shortUnits: String = ""
        var icon: String = ""
        var lastWeek: [Int] = [1,2,3,4,5,6,7]
        var palette: Palette = .fusionred
    }
    
    var data: Data {
        Data(title: title, goal: goal, units: units, shortUnits: shortUnits, icon: icon, lastWeek: lastWeek, palette: palette)
    }
}

extension Measurement {
    static let sampleData: [Measurement] =
    [
        Measurement(title: "Weight", goal: 160, units: "pounds", shortUnits: "lbs", icon: "scalemass.fill", lastWeek: [155,157,157,159,156,163,162], palette: .bluegrey),
        Measurement(title: "Heart Rate", goal: 50, units: "bpm", shortUnits: "bpm", icon: "heart.fill", lastWeek: [54,59,52,54,60,53,50], palette: .bluehorizon),
    ]
}

enum MeasurementType {
    case weight
    case heartRate
}
