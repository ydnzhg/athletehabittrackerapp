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
    var gender: Bool
    // inches
    var height: Int
    // pounds
    var weight: Int
    var profilePicture: String
    
    init(name: String, gender: Bool, height: Int, weight: Int, profilePicture: String) {
        self.name = name
        self.gender = gender
        self.height = height
        self.weight = weight
        self.profilePicture = profilePicture
    }
}

extension User {
    static let sampleData: User = User(name: "Andy Zhang", gender: true, height: 71, weight: 165, profilePicture: "placeholderpfp")
}
