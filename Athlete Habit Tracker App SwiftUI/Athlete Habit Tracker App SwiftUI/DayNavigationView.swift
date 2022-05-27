//
//  DayNavigationView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/23/22.
//

import SwiftUI

struct DayNavigationView: View {
    @State private var chosenDay = Date()
    
    var date: String
    
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "chevron.backward")
            }
            Text("\(date)")
                .font(.title.bold())
            Button(action: {}) {
                Image(systemName: "chevron.forward")
            }
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .trailing) {
            Button(action: {}) {
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding()
        }
    }
}

struct DayNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        DayNavigationView(date: "This Week")
            .previewLayout(.fixed(width: 400, height: 50))
    }
}
