//
//  TrainingHabitInputView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/30/22.
//

import SwiftUI

struct TrainingHabitInputView: View {
    
    @Binding var trainingHabits: [TrainingHabit]
    let measurements: [Measurement]

    @State private var currentWeight = 0
    @State private var currentHeartRate = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach($trainingHabits) { $trainingHabit in
                    TrainingHabitInputTextField(trainingHabit: $trainingHabit, placeholder: "\(trainingHabit.title)")
                }
                /*
                TrainingHabitInputTextField(trainingHabit: trainingHabits[0], placeholder: "Hours of Sleep", value: $sleep)
                TrainingHabitInputTextField(trainingHabit: trainingHabits[1], placeholder: "Amount of Water", value: $drink)
                TrainingHabitInputTextField(trainingHabit: trainingHabits[2], placeholder: "Protein Consumed", value: $protein)
                TrainingHabitInputTextField(trainingHabit: trainingHabits[3], placeholder: "Calories Consumed", value: $calories)
                TrainingHabitInputTextField(trainingHabit: trainingHabits[4], placeholder: "Stretching Time", value: $stretch)
                TrainingHabitInputTextField(trainingHabit: trainingHabits[5], placeholder: "Workout Time", value: $workout)
                */
                MeasurementInputTextField(measurement: measurements[0], placeholder: "Current Weight", value: $currentWeight)
                MeasurementInputTextField(measurement: measurements[1], placeholder: "Current Heart Rate", value: $currentHeartRate)
                
                Spacer()
            }
        }
    }
}

struct TrainingHabitInputView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingHabitInputView(trainingHabits: .constant(TrainingHabit.sampleData), measurements: Measurement.sampleData)
    }
}

struct TrainingHabitInputTextField: View {
    
    @Binding var trainingHabit: TrainingHabit
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Image(systemName: trainingHabit.icon)
                .font(.system(size: 25))
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(trainingHabit.palette.mainColor)
                .clipShape(Circle())
            HStack {
                Text("\(placeholder): ")
                    .foregroundColor(Color.black.opacity(0.7))
                Spacer()
                TextField("\(trainingHabit.units)", value: $trainingHabit.today, format: .number)
                    .font(.body.bold())
                    .foregroundColor(.highblue)
                    .frame(width: 100)
            }
            .padding()
            .padding(.leading, 60)
            .frame(height: 60)
            .background(Color.bluegrey.opacity(0.1))
            .clipShape(Capsule())
        }
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

struct MeasurementInputTextField: View {
    
    var measurement: Measurement
    var placeholder: String

    @Binding var value: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Image(systemName: measurement.icon)
                .font(.system(size: 25))
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(measurement.palette.mainColor)
                .clipShape(Circle())
            HStack {
                Text("\(placeholder): ")
                    .foregroundColor(Color.black.opacity(0.7))
                Spacer()
                TextField("\(measurement.units)", value: $value, format: .number)
                    .frame(width: 100)
            }
            .padding()
            .padding(.leading, 60)
            .frame(height: 60)
            .background(Color.bluegrey.opacity(0.1))
            .clipShape(Capsule())
        }
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
