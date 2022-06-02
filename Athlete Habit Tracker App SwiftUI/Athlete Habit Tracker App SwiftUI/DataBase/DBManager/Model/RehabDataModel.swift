//
//  RehabDataModel.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by 叶建锋 on 2022/6/1.
//

import Foundation
import UIKit
import SQLite
/// RehabData
struct RehabDataModel {
    var dataID: Int = 1
    var didWorkout: Int = 1
    var partOfBody: Int = 1
    var intensity: Double = 0.0
    var sets: Int = 0
    var pain: Double = 0.0
    var createTime:String = ""
    init() {
        
    }
    
    init(dataID: Int, didWorkout: Int,partOfBody: Int,intensity: Double, sets: Int,pain: Double,createTime:String) {
        self.dataID = dataID
        self.didWorkout = didWorkout
        self.partOfBody = partOfBody
        self.intensity = intensity
        self.sets = sets
        self.pain = pain
        self.createTime = createTime

    }
}


class RehabDataObject: ObservableObject {
    var dataID: Int
    @Published var didWorkout: Int
    @Published var partOfBody: Int
    @Published var intensity: Double
    @Published var sets: Int
    @Published var pain: Double
    var createTime: String
    init() {
        if(!SQLiteDataStore.sharedInstance.initOk)
        {
            try! SQLiteDataStore.sharedInstance.createTables();
        }
        
        let data = try! RehabDataHelper.findOneDay(date: Date())
        self.dataID = data.dataID
        self.didWorkout = data.didWorkout
        self.partOfBody = data.partOfBody;
        self.intensity = data.intensity;
        self.pain = data.pain
        self.sets = data.sets
        self.createTime = data.createTime
        
    }
    func commitToDB()-> Bool {
        do {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateStr = timeFormatter.string(from:Date()) as String
            let res = try RehabDataHelper.update(item: RehabDataModel(dataID: dataID, didWorkout: didWorkout,partOfBody: partOfBody,intensity: intensity,sets: sets,pain: pain,createTime: dateStr))
            return res
        } catch _ {
            print("inster userModel error")
        }
        
        return false
    }
}
