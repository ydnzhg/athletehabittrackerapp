//
//  Athlete_Habit_Tracker_App_SwiftUIApp.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/18/22.
//

import SwiftUI

@main
struct Athlete_Habit_Tracker_App_SwiftUIApp: App {
    
    @State private var isPresentingInitialInput = true
    @ObservedObject var user = UserInfoDataObject()
    init(){
        try! SQLiteDataStore.sharedInstance.createTables();
    }
    var body: some Scene {
        WindowGroup {
            // ContentView(isPresentingInfoEditView: true, isPresentingCalendarView: false, intensity: .constant(0.0), sets: .constant(0), pain: .constant(0.0), entries: Entry.sampleData, selectedTabIndex: 0)
            ContentView(intensity: .constant(0.0), sets: .constant(0), pain: .constant(0.0), entries: Entry.sampleData, measurements: Measurement.sampleData, selectedTabIndex: 0)
                .sheet(isPresented: $isPresentingInitialInput) {
                    NavigationView {
                        InfoEditView(user:user)
                            .navigationTitle("Welcome!")
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") {
                                        isPresentingInitialInput = false
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Done") {
                                        print(user.userName)
                                        user.commitToDB()
                                        //try! UserinfoDataHelper.insert(item:InfoEditView().getUserDataModel())
                                        isPresentingInitialInput = false
                                    }
                                }
                            }
                        
                    }
                }
        }
    }
}


