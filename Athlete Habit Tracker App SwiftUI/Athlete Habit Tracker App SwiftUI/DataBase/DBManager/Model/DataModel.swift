//
//  DataModel.swift
//  HQSQLite-Swift
//
//  Created by yejf on 2022/5/28.
//  Copyright © 2022年 yejf. All rights reserved.
//

import Foundation
import UIKit
import SQLite

/// user Info
struct UserInfoModel {

    var userID: Int = 0
    var userName: String = ""
    var height: Double = 0.0
    var weight: Double = 0.0
    var gender: Bool = false
    var picturePath : String = ""
    var createTime:Date = Date()

    init() {}
    
    init(userID: Int, userName: String,height: Double,weight: Double,gender: Bool,picturePath : String,createTime:Date) {
        self.userID = userID
        self.userName = userName
        self.height = height
        self.weight = weight
        self.gender = gender
        self.picturePath = picturePath
        self.createTime = createTime
        //self.icon = icon

    }
}

// User Icon store
extension NSData: Value {

    // SQL Type
    public class var declaredDatatype: String {
        return Blob.declaredDatatype
    }
    // Decode
    public class func fromDatatypeValue(_ datatypeValue: Blob) -> NSData {
        return NSData(bytes: datatypeValue.bytes, length: datatypeValue.bytes.count)
    }
    // Encode
    public var datatypeValue: Blob {
        return Blob(bytes: self.bytes, length: self.length)
    }
}

extension UIImage: Value {
    public class var declaredDatatype: String {
        return Blob.declaredDatatype
    }
    public class func fromDatatypeValue(_ blobValue: Blob) -> UIImage {
        return UIImage(data: Data.fromDatatypeValue(blobValue))!
    }
    public var datatypeValue: Blob {
        return self.pngData()!.datatypeValue
    }

}
