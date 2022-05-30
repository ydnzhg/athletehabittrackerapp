//
//  DayNavigationView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/23/22.
//

import SwiftUI

struct DayNavigationView: View {
    
    @Binding var isPresentingCalendarView: Bool
    @Binding var date: Date
    
    var timePeriod: String
    
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "chevron.backward")
            }
            Text("\(timePeriod)")
                .font(.title.bold())
            Button(action: {}) {
                Image(systemName: "chevron.forward")
            }
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .trailing) {
            Button(action: {
                isPresentingCalendarView = true
            }) {
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding()
            .popover(present: $isPresentingCalendarView) {
                CalendarPopoverView(date: $date)
            }
        }
        
    }
}

struct DayNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        DayNavigationView(isPresentingCalendarView: .constant(true), date: .constant(Date()), timePeriod: "This Week")
    }
}
