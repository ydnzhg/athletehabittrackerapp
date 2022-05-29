//
//  DataHelperProtocol.swift
//  HQSQLite-Swift
//
//  Created by yejf on 2022/5/28.
//  Copyright © 2022年 yejf. All rights reserved.
//

import Foundation

protocol DataHelperProtocol {
    associatedtype T
    
    static func createTable() throws -> Void
    
    static func insert(item: T) throws -> Int
    
    static func find(queryUserID: Int) throws -> [T]
    
}
//Optional implementation
extension DataHelperProtocol {

    static func update(id: Int, value: T) throws -> T? { return nil }
    
    static func update(item: T) throws -> Bool { return false }
    
    static func delete(item: T) throws -> Bool { return false }
    
    static func findAll() throws -> [T]? { return nil }
    
    static func checkColumnExists(queryUserID: Int) throws -> Bool { return false }

}
