//
//  ContentView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/27/22.
//

import SwiftUI

let today = "5/7"

let exampleDates = ["5/1", "5/2", "5/3", "5/4", "5/5", "5/6", "5/7"]

struct AppView: View {
    
    @Binding var user: User
    
    @Binding var trainingHabits: [TrainingHabit]
    
    @Binding var workoutInfo: WorkoutInfo

    @State private var date = Date()
    
    @State private var selectedTabIndex = 0
    
    let tabBarImageNames = ["list.bullet.rectangle.portrait.fill", "heart.text.square.fill", "sparkle", "chart.xyaxis.line", "person.fill"]
    
    @State private var isPresentingInfoEditView = true
    @State private var isPresentingCalendarView = false

    let measurements: [Measurement]
    
    var body: some View {
        VStack {
            // custom tab bar
            ZStack {
                switch selectedTabIndex {
                case 0:
                    NavigationView {
                        DailyView(trainingHabits: $trainingHabits, measurements: measurements)
                            .navigationTitle("Training Habits")
                            .toolbar {
                                DatePicker("", selection: $date, displayedComponents: .date)
                            }
                    }
                case 1:
                    NavigationView {
                        RehabView(workoutInfo: $workoutInfo)
                            .navigationTitle("Workout Log")
                            .toolbar {
                                DatePicker("", selection: $date, displayedComponents: .date)
                            }
                    }
                case 2:
                    LoadCapacityPredictionView(trainingHabits: $trainingHabits, workoutInfo: $workoutInfo)
                case 3:
                    VStack {
                        DayNavigationView(isPresentingCalendarView: $isPresentingCalendarView, date: $date, timePeriod: "This Week")
                            .padding(.bottom, -5)
                        // ChartAndDataView(entries: TrainingHabit.sampleData)
                    }
                case 4:
                    ProfileView(user: $user, trainingHabits: $trainingHabits)
                default:
                    Text("Test")
                }
            }
            
            Spacer()
            
            Divider()
                .padding(.bottom, 10)
            
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        selectedTabIndex = num
                    }) {
                        Spacer()
                        Image(systemName: tabBarImageNames[num])
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(selectedTabIndex == num ? .black : .init(white: 0.8))
                        Spacer()
                    }
                }
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(user: .constant(User.sampleData), trainingHabits: .constant(TrainingHabit.sampleData), workoutInfo: .constant(WorkoutInfo.blankSampleData), measurements: Measurement.sampleData)
    }
}
