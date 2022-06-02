//
//  TraceOptionsDataModel.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by 叶建锋 on 2022/5/29.
//

import Foundation


import UIKit
import SQLite

/// TraceOptionsData
struct TraceOptionsDataModel {

    var dataID: Int = 0
    var title: String = ""
    var goal: Int = 0
    var unit:String = ""
    var shortUnits: String=""
    var icon: String=""
    var lastWeek: [Int] = [1,2,3,4,5,6,7]
    var palette: Palette = .fusionred

    init() {}
    
    init(dataID: Int, title: String,goal: Int,unit : String,shortUnits :String,icon : String) {
        self.dataID = dataID
        self.title = title
        self.goal = goal
        self.unit = unit
        self.shortUnits = shortUnits
        self.icon = icon
        self.lastWeek = [1,2,3,4,5,6,7] // ？？ 这个lastWeek 是一个星期概念 还是 7天的
        self.palette = .blue

    }
    func getDetailScore(date: Date) -> Int
    {
        do{
            let data = try TraceOptionsDetailDataHelper.findOneDay(date: date, optionId: dataID);
            return data.inputScore;
            

        }catch _ {
            print("inster userModel error")
        }
        
        return 0;
    }
}
class TraceOptionsDataObject: ObservableObject {
    @Published var sleep: Int
    @Published var hydration: Int
    @Published var protein: Int
    @Published var calorie: Int
    @Published var stretching: Int
    @Published var workout: Int
    @Published var weight: Int
    @Published var heartrate: Int
    var optionsArray:[TraceOptionsDataModel]
    var detailArray:[TraceOptionsDetailDataModel]
    var useDate : Date
    //today
    init(detail : Bool, date: Date)
    {
        if(!SQLiteDataStore.sharedInstance.initOk)
        {
            try! SQLiteDataStore.sharedInstance.createTables();
        }
        
        self.optionsArray = try! TraceOptionsDataHelper.findAll()!;
        useDate = date;
        self.detailArray = try! TraceOptionsDetailDataHelper.findOneDay(date: date);
        if(self.detailArray.isEmpty)
        {
            self.sleep = 0;
            self.hydration = 0;
            self.protein = 0;
            self.calorie = 0;
            self.stretching = 0;
            self.workout = 0;
            self.weight = 0;
            self.heartrate = 0;
        }else
        {
            self.sleep = self.detailArray[0].inputScore;
            self.hydration = self.detailArray[1].inputScore;
            self.protein = self.detailArray[2].inputScore;
            self.calorie = self.detailArray[3].inputScore;
            self.stretching = self.detailArray[4].inputScore;
            self.workout = self.detailArray[5].inputScore;
            self.weight = self.detailArray[6].inputScore;
            self.heartrate = self.detailArray[7].inputScore;
        }
        self.optionsArray[0].palette = .lighterpurple;
        self.optionsArray[1].palette = .blue;
        self.optionsArray[2].palette = .orangehibiscus;
        self.optionsArray[3].palette = .maximumbluegreen;
        self.optionsArray[4].palette = .reptilegreen;
        self.optionsArray[5].palette = .fusionred;
        self.optionsArray[6].palette = .bluegrey;
        self.optionsArray[7].palette = .bluehorizon;
    }
    init() {
        if(!SQLiteDataStore.sharedInstance.initOk)
        {
            try! SQLiteDataStore.sharedInstance.createTables();
        }
        useDate = Date();
        self.detailArray = [TraceOptionsDetailDataModel]()
        self.optionsArray = try! TraceOptionsDataHelper.findAll()!;
        self.sleep = self.optionsArray[0].goal;
        self.hydration = self.optionsArray[1].goal;
        self.protein = self.optionsArray[2].goal;
        self.calorie = self.optionsArray[3].goal;
        self.stretching = self.optionsArray[4].goal;
        self.workout = self.optionsArray[5].goal;
        self.weight = self.optionsArray[6].goal;
        self.heartrate = self.optionsArray[7].goal;
        self.optionsArray[0].palette = .lighterpurple;
        self.optionsArray[1].palette = .blue;
        self.optionsArray[2].palette = .orangehibiscus;
        self.optionsArray[3].palette = .maximumbluegreen;
        self.optionsArray[4].palette = .reptilegreen;
        self.optionsArray[5].palette = .fusionred;
        self.optionsArray[6].palette = .bluegrey;
        self.optionsArray[7].palette = .bluehorizon;
    }
    func commitToOptionsDB()-> Bool {
        do {
            optionsArray[0].goal = sleep
            optionsArray[1].goal = hydration
            optionsArray[2].goal = protein
            optionsArray[3].goal = calorie
            optionsArray[4].goal = stretching
            optionsArray[5].goal = workout
            optionsArray[6].goal = weight
            optionsArray[7].goal = heartrate
            var res = true
            for item in  optionsArray {
                res = try TraceOptionsDataHelper.update(item: item)
            }
            return res
        } catch _ {
            print("inster userModel error")
        }
        
        return false
    }
    
    func commitToOptionsDetailDB()-> Bool {
        do {
            optionsArray[0].goal = sleep
            optionsArray[1].goal = hydration
            optionsArray[2].goal = protein
            optionsArray[3].goal = calorie
            optionsArray[4].goal = stretching
            optionsArray[5].goal = workout
            optionsArray[6].goal = weight
            optionsArray[7].goal = heartrate
            if(self.detailArray.isEmpty)
            {
                let dateFormatter = DateFormatter.init()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let id0 = try TraceOptionsDetailDataHelper.getNewId()
                let  detailModel0 = TraceOptionsDetailDataModel(detailID: id0, optionId: optionsArray[0].dataID, optionName:optionsArray[0].title,inputScore: optionsArray[0].goal, score: 0,unit:optionsArray[0].unit,createTime:useDate);
                try TraceOptionsDetailDataHelper.insert(item: detailModel0 );
                
                
                let id1 = try TraceOptionsDetailDataHelper.getNewId()
                let  detailModel1 = TraceOptionsDetailDataModel(detailID: id1, optionId: optionsArray[1].dataID, optionName:optionsArray[1].title,inputScore: optionsArray[1].goal, score: 0,unit:optionsArray[1].unit,createTime:useDate);
                try TraceOptionsDetailDataHelper.insert(item: detailModel1 );
                
                let id2 = try TraceOptionsDetailDataHelper.getNewId()
                let  detailModel2 = TraceOptionsDetailDataModel(detailID: id2, optionId: optionsArray[2].dataID, optionName:optionsArray[2].title,inputScore: optionsArray[2].goal, score: 0,unit:optionsArray[2].unit,createTime:useDate);
                try TraceOptionsDetailDataHelper.insert(item: detailModel2 );
                
                let id3 = try TraceOptionsDetailDataHelper.getNewId()
                let  detailModel3 = TraceOptionsDetailDataModel(detailID: id3, optionId: optionsArray[3].dataID, optionName:optionsArray[3].title,inputScore: optionsArray[3].goal, score: 0,unit:optionsArray[3].unit,createTime:useDate);
                try TraceOptionsDetailDataHelper.insert(item: detailModel3 );
                
                let id4 = try TraceOptionsDetailDataHelper.getNewId()
                let  detailModel4 = TraceOptionsDetailDataModel(detailID: id4, optionId: optionsArray[4].dataID, optionName:optionsArray[4].title,inputScore: optionsArray[4].goal, score: 0,unit:optionsArray[4].unit,createTime:useDate);
                try TraceOptionsDetailDataHelper.insert(item: detailModel4 );
                
                let id5 = try TraceOptionsDetailDataHelper.getNewId()
                let  detailModel5 = TraceOptionsDetailDataModel(detailID: id5, optionId: optionsArray[5].dataID, optionName:optionsArray[5].title,inputScore: optionsArray[5].goal, score: 0,unit:optionsArray[5].unit,createTime:useDate);
                try TraceOptionsDetailDataHelper.insert(item: detailModel5 );
                
                let id6 = try TraceOptionsDetailDataHelper.getNewId()
                let  detailModel6 = TraceOptionsDetailDataModel(detailID: id6, optionId: optionsArray[6].dataID, optionName:optionsArray[6].title,inputScore: optionsArray[6].goal, score: 0,unit:optionsArray[6].unit,createTime:useDate);
                try TraceOptionsDetailDataHelper.insert(item: detailModel6 );
                
                let id7 = try TraceOptionsDetailDataHelper.getNewId()
                let  detailModel7 = TraceOptionsDetailDataModel(detailID: id7, optionId: optionsArray[7].dataID, optionName:optionsArray[7].title,inputScore: optionsArray[7].goal, score: 0,unit:optionsArray[7].unit,createTime:useDate);
                try TraceOptionsDetailDataHelper.insert(item: detailModel7 );
            }else
            {
                var i = 0;
                for var item in  detailArray {
                    item.inputScore = optionsArray[i].goal;
                    try TraceOptionsDetailDataHelper.update(item: item)
                    i += 1;
                }
            }
            return true
        } catch _ {
            print("inster userModel error")
        }
        return false
    }
}

