//
//  User.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/24/22.
//

import Foundation

struct User {
    var name: String
    // true for male false for female
    var gender: Int
    var age: Int
    // inches
    var height: Int
    // pounds
    var weight: Int
    var profilePicture: String
    
    init(name: String, gender: Int, age: Int, height: Int, weight: Int, profilePicture: String) {
        self.name = name
        self.gender = gender
        self.age = age
        self.height = height
        self.weight = weight
        self.profilePicture = profilePicture
    }
}

extension User {
    struct Data {
        var name: String = "Bob"
        var gender: Int = 0
        var age: Int = 25
        var height: Int = 70
        var weight: Int = 150
        var profilePicture: String = "placeholderpfp"
    }
    
    var data: Data {
        Data(name: name, gender: gender, age: age, height: height, weight: weight, profilePicture: profilePicture)
    }
    
    mutating func update(from data: Data) {
        name = data.name
        gender = data.gender
        age = data.age
        height = data.height
        weight = data.weight
    }
}

extension User {
    static let sampleData: User = User(name: "Andy Zhang", gender: 0, age: 17, height: 71, weight: 165, profilePicture: "placeholderpfp")
}
