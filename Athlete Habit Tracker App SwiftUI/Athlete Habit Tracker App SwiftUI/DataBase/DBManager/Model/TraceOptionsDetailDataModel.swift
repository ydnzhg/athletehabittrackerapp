//
//  TraceOptionsDetailDataModel.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by 叶建锋 on 2022/5/29.
//

import Foundation
import UIKit
import SQLite

/// TraceOptionsDetailDataModel
struct TraceOptionsDetailDataModel {

    var detailID: Int = 0
    var optionId: Int = 0
    var optionName: String = ""
    var score: Double = 0.0
    var unit : String = ""
    var createTime:Date = Date() //

    init() {}
    
    init(detailID: Int, optionId: Int,optionName: String,score: Double,unit : String,createTime:Date) {
        self.detailID = detailID
        self.optionId = optionId
        self.optionName = optionName
        self.score = score
        self.unit = unit
        self.createTime = createTime

    }
}
