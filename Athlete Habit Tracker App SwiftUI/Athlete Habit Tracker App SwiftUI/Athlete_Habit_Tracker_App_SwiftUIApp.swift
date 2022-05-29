//
//  Athlete_Habit_Tracker_App_SwiftUIApp.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/18/22.
//

import SwiftUI

@main
struct Athlete_Habit_Tracker_App_SwiftUIApp: App {
    init() {
        creatDB()
    }
    var body: some Scene {
        WindowGroup {
            DailyView(entries: Entry.sampleData)
        }

    }
    func creatDB() {
        do {
            try  SQLiteDataStore.sharedInstance.createTables()
        } catch _ {
            print("creat DB Error")
        }
    }
}
