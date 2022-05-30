//
//  CalendarPopoverView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/29/22.
//

import SwiftUI

struct CalendarPopoverView: View {
    @Binding var date: Date
    
    var body: some View {
        VStack {
            DatePicker("", selection: $date, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
        }
        .frame(width: 300, height: 300)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
        
    }
}

struct CalendarPopoverView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPopoverView(date: .constant(Date()))
    }
}
