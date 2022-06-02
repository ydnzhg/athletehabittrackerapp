//
//  ContentView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/27/22.
//

import SwiftUI

let today = "5/7"

let exampleDates = ["5/1", "5/2", "5/3", "5/4", "5/5", "5/6", "5/7"]

struct ContentView: View {

    @State private var date = Date()
    @State private var isPresentingInfoEditView = true
    @State private var isPresentingCalendarView = false
    @Binding var intensity: Double
    @Binding var sets: Int
    @Binding var pain: Double

    let entries: [Entry]
    let measurements: [Measurement]
    
    @State var selectedTabIndex = 0
    
    let tabBarImageNames = ["list.bullet.rectangle.portrait.fill", "heart.text.square.fill", "sparkle", "chart.xyaxis.line", "person.fill"]
    
    var body: some View {
        VStack {
            // custom tab bar
            ZStack {
                
                switch selectedTabIndex {
                case 0:
                    VStack {
                        DayNavigationView(isPresentingCalendarView: $isPresentingCalendarView, date: $date, timePeriod: "Today")
                        DailyView(isPresentingInfoEditView: .constant(true))
                    }
                case 1:
                    VStack {
                        DayNavigationView(isPresentingCalendarView: $isPresentingCalendarView, date: $date, timePeriod: "Today")
                            .padding(.bottom, -5)
                        RehabView()
                    }
                case 2:
                    LoadCapacityPredictionView(intensity: .constant(0), sets: .constant(0), pain: .constant(0))
                case 3:
                    VStack {
                        DayNavigationView(isPresentingCalendarView: $isPresentingCalendarView, date: $date, timePeriod: "This Week")
                            .padding(.bottom, -5)
                        ChartAndDataView(entries: Entry.sampleData)
                    }
                case 4:
                    ProfileView(user: User.sampleData)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(intensity: .constant(0), sets: .constant(0), pain: .constant(0), entries: Entry.sampleData, measurements: Measurement.sampleData)
    }
}
