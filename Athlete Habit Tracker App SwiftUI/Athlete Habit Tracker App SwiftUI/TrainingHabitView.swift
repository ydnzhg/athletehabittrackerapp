//
//  TrainingHabitView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 6/1/22.
//

import SwiftUI
import SwiftUICharts

struct TrainingHabitView: View {
    
    @Binding var trainingHabit: TrainingHabit

    var body: some View {
        VStack {
            CardView {
                ChartLabel("This Week", type: .title)
                BarChart()
            }
            .data(trainingHabit.lastWeek.map { Double($0) })
            .chartStyle(ChartStyle(backgroundColor: .white, foregroundColor: ColorGradient(Color.highblue.opacity(0.4), Color.highblue.opacity(0.7))))
            .frame(height: 300)
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle("\(trainingHabit.title)")
    }
}

struct TrainingHabitView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingHabitView(trainingHabit: .constant(TrainingHabit.sampleData[0]))
    }
}
