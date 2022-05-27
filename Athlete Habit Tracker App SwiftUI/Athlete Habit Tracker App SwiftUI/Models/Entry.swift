//
//  Entry.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/22/22.
//

import Foundation

struct Entry: Identifiable {
    let id: UUID
    var title: String
    var goal: Int
    var units: String
    var icon: String
    var lastWeek: [Int]
    var palette: Palette
    
    init(id: UUID = UUID(), title: String, goal: Int, units: String, icon: String, lastWeek: [Int], palette: Palette) {
        self.id = id
        self.title = title
        self.goal = goal
        self.units = units
        self.icon = icon
        self.lastWeek = lastWeek
        self.palette = palette
    }
}

extension Entry {
    struct Data {
        var title: String = ""
        var goal: Int = 15
        var units: String = ""
        var icon: String = ""
        var lastWeek: [Int] = [1,2,3,4,5,6,7]
        var palette: Palette = .fusionred
    }
    
    var data: Data {
        Data(title: title, goal: goal, units: units, icon: icon, lastWeek: lastWeek, palette: palette)
    }
}

extension Entry {
    static let sampleData: [Entry] =
    [
        Entry(title: "Sleep", goal: 8, units: "hours", icon: "powersleep", lastWeek: [9,8,6,8,8,9,7], palette: .lighterpurple),
        Entry(title: "Hydration", goal: 64, units: "oz", icon: "drop.fill", lastWeek: [62,65,75,67,51,58,53], palette: .blue),
        Entry(title: "Protein Intake", goal: 160, units: "grams", icon: "fork.knife", lastWeek: [177,164,143,146,180,168,141], palette: .orangehibiscus),
        Entry(title: "Calorie Intake", goal: 2300, units: "cal", icon: "bolt.fill", lastWeek: [2054,2160,2215,2048,2516,2445,2345], palette: .flirtacious),
        Entry(title: "Stretching", goal: 15, units: "min", icon: "stopwatch.fill", lastWeek: [11,17,15,19,15,19,14], palette: .reptilegreen),
        Entry(title: "Workout", goal: 60, units: "min", icon: "figure.walk", lastWeek: [73,50,63,45,60,46,48], palette: .fusionred)
    ]
}

enum EntryType {
    case sleep
    case protein
    case calorie
    case hydration
    case stretching
}
