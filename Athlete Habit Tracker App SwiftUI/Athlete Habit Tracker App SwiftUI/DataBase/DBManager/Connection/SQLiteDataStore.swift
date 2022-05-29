//
//  SQLiteDataStore.swift
//  HQSQLite-Swift
//
//  Created by yejf on 2022/5/28.
//  Copyright © 2022年 yejf. All rights reserved.
//

import Foundation
import SQLite

enum DataAccessError: Swift.Error {
    case datastoreConnectionError
    case insertError
    case deleteError
    case searchError
    case nilInData
    case nomoreData
}

class SQLiteDataStore {
    static let sharedInstance = SQLiteDataStore()
    let BBDB: Connection?
    
    private init() {
        
        let dirs: [NSString] =
        NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory,
                                                FileManager.SearchPathDomainMask.allDomainsMask, true) as [NSString]
        
        let dir = dirs[0]
        
        let path = dir.appendingPathComponent("myDB.sqlite");
       // let fileManager = FileManager.default
       // if fileManager.fileExists(atPath: path) {
       // do {
               // try fileManager.removeItem(atPath: path)
               // } catch _{}
       // }
        print("The DB Path:",path)
        
        
        do {
            BBDB = try Connection(path)
            BBDB?.busyTimeout = 5
            
            BBDB?.busyHandler({ tries in
                if tries >= 3 {
                    return false
                }
                return true
            })
        } catch _ {
            BBDB = nil 
        }
    }
    
    func createTables() throws{
        do {
            try UserinfoDataHelper.createTable()
            try TraceOptionsDataHelper.createTable()
            try TraceOptionsDetailDataHelper.createTable()
            //TraceOptionsDetailDataHelper.testDemo()
        } catch {
            throw DataAccessError.datastoreConnectionError
        }
        
    } 
}

