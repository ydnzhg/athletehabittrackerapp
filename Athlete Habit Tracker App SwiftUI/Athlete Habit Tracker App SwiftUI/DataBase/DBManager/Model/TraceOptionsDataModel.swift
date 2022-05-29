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
    var optionName: String = ""
    var goal: Double = 0.0
    var unit:String = ""

    init() {}
    
    init(dataID: Int, optionName: String,goal: Double,unit : String) {
        self.dataID = dataID
        self.optionName = optionName
        self.goal = goal
        self.unit = unit

    }
}

