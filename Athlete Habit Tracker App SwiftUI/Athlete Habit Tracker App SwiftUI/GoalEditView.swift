//
//  GoalEditView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/29/22.
//

import SwiftUI

struct GoalEditView: View {
    
   // let entries: [Entry]
    //let measurements: [Measurement]
    @ObservedObject var traceOptionsObject : TraceOptionsDataObject
   // @State private var sleepGoal = 0
   // @State private var hydrationGoal = 0
   // @State private var proteinGoal = 0
   // @State private var calorieGoal = 0
   // @State private var stretchingGoal = 0
   // @State private var workoutGoal = 0
   // @State private var weightGoal = 0
   // @State private var heartrateGoal = 0

    
    var body: some View {
        VStack(spacing: 15) {
            EntryTextField(entry: traceOptionsObject.optionsArray[0], placeholder: "Sleep Goal", value: $traceOptionsObject.sleep)
            EntryTextField(entry: traceOptionsObject.optionsArray[1], placeholder: "Hydration Goal", value: $traceOptionsObject.hydration)
            EntryTextField(entry: traceOptionsObject.optionsArray[2], placeholder: "Protein Goal", value: $traceOptionsObject.protein)
            EntryTextField(entry: traceOptionsObject.optionsArray[3], placeholder: "Calorie Goal", value: $traceOptionsObject.calorie)
            EntryTextField(entry: traceOptionsObject.optionsArray[4], placeholder: "Stretching Goal", value: $traceOptionsObject.stretching)
            EntryTextField(entry: traceOptionsObject.optionsArray[5], placeholder: "Workout Goal", value: $traceOptionsObject.workout)
            MeasurementTextField(measurement: traceOptionsObject.optionsArray[6], placeholder: "Weight Goal", value: $traceOptionsObject.weight)
            MeasurementTextField(measurement: traceOptionsObject.optionsArray[7], placeholder: "Heart Rate Goal", value: $traceOptionsObject.heartrate)
        }
    }
}

struct GoalEditView_Previews: PreviewProvider {
    static var previews: some View {
        GoalEditView(traceOptionsObject : TraceOptionsDataObject())
    }
}
