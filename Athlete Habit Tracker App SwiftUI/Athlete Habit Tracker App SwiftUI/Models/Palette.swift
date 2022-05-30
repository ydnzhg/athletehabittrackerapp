//
//  Palette.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/25/22.
//

import SwiftUI

enum Palette: String, CaseIterable, Identifiable, ShapeStyle {
    case blue
    case bluegrey
    case bluehorizon
    case flirtacious
    case fusionred
    case gloomypurple
    case highblue
    case lighterpurple
    case maximumbluegreen
    case orangehibiscus
    case reptilegreen
    case twinkleblue
    
    var accentColor: Color {
        switch self {
        case .blue, .bluegrey, .bluehorizon, .flirtacious, .fusionred, .gloomypurple, .highblue, .lighterpurple, .maximumbluegreen, .orangehibiscus, .reptilegreen, .twinkleblue: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}

extension Color {
    static let blue = Color("blue")
    static let bluegrey = Color("bluegrey")
    static let bluehorizon = Color("bluehorizon")
    static let flirtacious = Color("flirtacious")
    static let fusionred = Color("fusionred")
    static let gloomypurple = Color("gloomypurple")
    static let highblue = Color("highblue")
    static let lighterpurple = Color("lighterpurple")
    static let maximumbluegreen = Color("maximumbluegreen")
    static let orangehibiscus = Color("orangehibiscus")
    static let reptilegreen = Color("reptilegreen")
    static let twinkleblue = Color("twinkleblue")
}
