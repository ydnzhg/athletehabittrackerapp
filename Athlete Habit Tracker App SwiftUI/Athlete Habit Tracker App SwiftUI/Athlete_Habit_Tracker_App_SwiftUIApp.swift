//
//  Athlete_Habit_Tracker_App_SwiftUIApp.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/18/22.
//

import SwiftUI

@main
struct Athlete_Habit_Tracker_App_SwiftUIApp: App {
    
    @State private var user = User.sampleData
        
    @State private var trainingHabits = TrainingHabit.sampleData
    
    @State private var workoutInfo = WorkoutInfo.blankSampleData
    
    @State private var isPresentingInitialInput = true
    
    var body: some Scene {
        WindowGroup {
            AppView(user: $user, trainingHabits: $trainingHabits, workoutInfo: $workoutInfo, measurements: Measurement.sampleData)

        }
    }
}


// ContentView(isPresentingInfoEditView: true, isPresentingCalendarView: false, intensity: .constant(0.0), sets: .constant(0), pain: .constant(0.0), entries: Entry.sampleData, selectedTabIndex: 0)
    /*
    .sheet(isPresented: $isPresentingInitialInput)

        NavigationView {
            InfoEditView(userData: )
                .navigationTitle("Welcome!")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingInitialInput = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentingInitialInput = false
                        }
                    }
                }
        }
        */
