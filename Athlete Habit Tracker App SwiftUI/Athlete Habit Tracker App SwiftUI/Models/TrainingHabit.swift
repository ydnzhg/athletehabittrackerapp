//
//  TrainingHabit.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/22/22.
//

import Foundation

struct TrainingHabit: Identifiable {
    let id: UUID
    var title: String
    var goal: Int
    var units: String
    var shortUnits: String
    var icon: String
    var lastWeek: [Int]
    var today: Int
    var palette: Palette
    
    init(id: UUID = UUID(), title: String, goal: Int, units: String, shortUnits: String, icon: String, lastWeek: [Int], today: Int, palette: Palette) {
        self.id = id
        self.title = title
        self.goal = goal
        self.units = units
        self.shortUnits = shortUnits
        self.icon = icon
        self.lastWeek = lastWeek
        self.today = today
        self.palette = palette
    }
}

extension TrainingHabit {
    struct Data {
        var title: String = ""
        var goal: Int = 0
        var units: String = ""
        var shortUnits: String = ""
        var icon: String = ""
        var lastWeek: [Int] = [0,0,0,0,0,0,0]
        var today: Int = 0
        var palette: Palette = .fusionred
    }
    
    var data: Data {
        Data(title: title, goal: goal, units: units, shortUnits: shortUnits, icon: icon, lastWeek: lastWeek, today: today, palette: palette)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        goal = data.goal
        units = data.shortUnits
        icon = data.icon
        lastWeek = data.lastWeek
        today = data.today
        palette = data.palette
    }
}

extension TrainingHabit {
    static let sampleData: [TrainingHabit] =
    [
        TrainingHabit(title: "Sleep", goal: 8, units: "hours", shortUnits: "hrs", icon: "powersleep", lastWeek: [9,8,6,8,8,9,7], today: 0, palette: .lighterpurple),
        TrainingHabit(title: "Hydration", goal: 64, units: "ounces", shortUnits: "oz", icon: "drop.fill", lastWeek: [62,65,75,67,51,58,53], today: 0, palette: .royalblue),
        TrainingHabit(title: "Protein Intake", goal: 160, units: "grams", shortUnits: "g", icon: "fork.knife", lastWeek: [177,164,143,146,180,168,141], today: 0, palette: .orangehibiscus),
        TrainingHabit(title: "Calorie Intake", goal: 2300, units: "kcal", shortUnits: "cal", icon: "bolt.fill", lastWeek: [2054,2160,2215,2048,2516,2445,2345], today: 0, palette: .maximumbluegreen),
        TrainingHabit(title: "Stretching", goal: 15, units: "minutes", shortUnits: "min", icon: "stopwatch.fill", lastWeek: [11,17,15,19,15,19,14], today: 0, palette: .reptilegreen),
        TrainingHabit(title: "Workout", goal: 60, units: "minutes", shortUnits: "min", icon: "figure.walk", lastWeek: [73,50,63,45,60,46,48], today: 0, palette: .fusionred)
    ]
}

enum TrainingHabitType {
    case sleep
    case protein
    case calorie
    case hydration
    case stretching
}
