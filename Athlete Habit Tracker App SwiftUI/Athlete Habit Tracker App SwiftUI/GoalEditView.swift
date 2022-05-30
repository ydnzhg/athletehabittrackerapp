//
//  GoalEditView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/29/22.
//

import SwiftUI

struct GoalEditView: View {
    
    let entries: [Entry]
    let measurements: [Measurement]
    
    @State private var sleepGoal = 0
    @State private var hydrationGoal = 0
    @State private var proteinGoal = 0
    @State private var calorieGoal = 0
    @State private var stretchingGoal = 0
    @State private var workoutGoal = 0
    @State private var weightGoal = 0
    @State private var heartrateGoal = 0

    
    var body: some View {
        VStack(spacing: 15) {
            EntryTextField(entry: entries[0], placeholder: "Sleep Goal", value: $sleepGoal)
            EntryTextField(entry: entries[1], placeholder: "Hydration Goal", value: $hydrationGoal)
            EntryTextField(entry: entries[2], placeholder: "Protein Goal", value: $proteinGoal)
            EntryTextField(entry: entries[3], placeholder: "Calorie Goal", value: $calorieGoal)
            EntryTextField(entry: entries[4], placeholder: "Stretching Goal", value: $stretchingGoal)
            EntryTextField(entry: entries[5], placeholder: "Workout Goal", value: $workoutGoal)
            MeasurementTextField(measurement: measurements[0], placeholder: "Weight Goal", value: $weightGoal)
            MeasurementTextField(measurement: measurements[1], placeholder: "Heart Rate Goal", value: $heartrateGoal)
        }
    }
}

struct GoalEditView_Previews: PreviewProvider {
    static var previews: some View {
        GoalEditView(entries: Entry.sampleData, measurements: Measurement.sampleData)
    }
}
