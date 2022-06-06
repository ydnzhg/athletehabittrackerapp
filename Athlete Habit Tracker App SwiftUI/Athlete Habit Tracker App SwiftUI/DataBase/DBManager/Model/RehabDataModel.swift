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
    var dataID: Int = 0
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
    var dataModel : RehabDataModel
    var useDate: Date
    init() {
        if(!SQLiteDataStore.sharedInstance.initOk)
        {
            try! SQLiteDataStore.sharedInstance.createTables();
        }
        
        dataModel = try! RehabDataHelper.findOneDay(date: Date());
        self.dataID = dataModel.dataID;
        self.didWorkout = dataModel.didWorkout;
        self.partOfBody = dataModel.partOfBody;
        self.intensity = dataModel.intensity;
        self.pain = dataModel.pain
        self.sets = dataModel.sets
        self.createTime = dataModel.createTime
        useDate = Date();
        
    }
    init(date: Date) {
        if(!SQLiteDataStore.sharedInstance.initOk)
        {
            try! SQLiteDataStore.sharedInstance.createTables();
        }
       
        dataModel = try! RehabDataHelper.findOneDay(date:date);
        self.dataID = dataModel.dataID;
        self.didWorkout = dataModel.didWorkout
        self.partOfBody = dataModel.partOfBody;
        self.intensity = dataModel.intensity;
        self.pain = dataModel.pain;
        self.sets = dataModel.sets;
        self.createTime = dataModel.createTime;
        useDate = date;
    }
    func getRehabDataInDate(date: Date) -> Bool
    {
        do{
            dataModel = try RehabDataHelper.findOneDay(date: date);
            self.dataID = dataModel.dataID
            self.didWorkout = dataModel.didWorkout
            self.partOfBody = dataModel.partOfBody;
            self.intensity = dataModel.intensity;
            self.pain = dataModel.pain
            self.sets = dataModel.sets
            self.createTime = dataModel.createTime
            useDate = date;
            return true

        }catch _ {
            print("inster userModel error")
        }
        
        return false;
    }
    func commitToDB()-> Void {
        do {
            if(dataID == 0)
            {
                let timeFormatter = DateFormatter()
                timeFormatter.dateFormat = "yyyy-MM-dd"
                let dateStr = timeFormatter.string(from:useDate) as String
                dataID = try RehabDataHelper.getNewId()
                let res = try RehabDataHelper.insert(item: RehabDataModel(dataID: dataID, didWorkout: didWorkout,partOfBody: partOfBody,intensity: intensity,sets: sets,pain: pain,createTime: dateStr))
                return
            }
            var  res = false
            if(dataModel.didWorkout != didWorkout)
            {
                res = try RehabDataHelper.updateColumn(columnId: 0, value: Double(didWorkout), dataID: dataID)
                if(res)
                {
                    dataModel.didWorkout = didWorkout
                }
            }
            
            if(dataModel.partOfBody != partOfBody)
            {
                res = try RehabDataHelper.updateColumn(columnId: 1, value: Double(partOfBody), dataID: dataID)
                if(res)
                {
                    dataModel.partOfBody = partOfBody
                }
            }
            
            if(dataModel.intensity != intensity)
            {
                res = try RehabDataHelper.updateColumn(columnId: 2, value: Double(intensity), dataID: dataID)
                if(res)
                {
                    dataModel.intensity = intensity
                }
            }
            
            if(dataModel.sets != sets)
            {
                res = try RehabDataHelper.updateColumn(columnId: 3, value: Double(sets), dataID: dataID)
                if(res)
                {
                    dataModel.sets = sets
                }
            }
            
            if(dataModel.pain != pain)
            {
                res = try RehabDataHelper.updateColumn(columnId: 4, value: Double(pain), dataID: dataID)
                if(res)
                {
                    dataModel.pain = pain
                }
            }
            return
            
        } catch _ {
            print("update userModel error")
        }
        
        return
    }
}
