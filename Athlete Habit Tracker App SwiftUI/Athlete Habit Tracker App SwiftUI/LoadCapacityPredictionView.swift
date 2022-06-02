//
//  LoadCapacityPredictionView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/27/22.
//

import SwiftUI
import SwiftUICharts

struct LoadCapacityPredictionView: View {
    
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    @Binding var trainingHabits: [TrainingHabit]
    
    @Binding var workoutInfo: WorkoutInfo
    
    var body: some View {
        VStack {
            
            HStack {
                VStack(spacing: 10) {
                    Text("\(workoutInfo.sets * Int(workoutInfo.intensity))")
                        .font(.title2.bold())
                    Text("Load Calculation")
                        .font(.caption)
                }
                .frame(width: 115, height: 80)
                .background(Color.twinkleblue)
                .cornerRadius(10)
                
                VStack(spacing: 10) {
                    Text("\(recoveryScoreCalculation(trainingHabits: trainingHabits))")
                        .font(.title2.bold())
                    Text("Recovery Score")
                        .font(.caption)
                }
                .frame(width: 115, height: 80)
                .background(Color.twinkleblue)
                .cornerRadius(10)
                
                VStack(spacing: 10) {
                    Text("\(Int(workoutInfo.pain) * 10)")
                        .font(.title2.bold())
                    Text("Pain Score")
                        .font(.caption)
                }
                .frame(width: 115, height: 80)
                .background(Color.twinkleblue)
                .cornerRadius(10)
            }
            .padding()
            
            CardView {
                ChartLabel("Test", type: .title)
                LineChart()
            }
            .data(demoData)
            .chartStyle(ChartStyle(backgroundColor: .white, foregroundColor: ColorGradient(Color.highblue.opacity(0.7), Color.highblue.opacity(0.4))))
            .frame(height: 300)
            .padding(.horizontal)

            
            /*
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.twinkleblue)
                    .padding(.horizontal, 20)
                    .frame(width: 400, height: 45)
                ZStack {
                    Circle()
                        .foregroundColor(.fusionred)
                        .frame(width: 60, height: 60)
                    Text("\(Int(intensity) * sets)")
                        .foregroundColor(.white)
                        .font(.title3.bold())
                }
                .padding(.horizontal)
                Text("Load Calculation")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
            
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center)) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.twinkleblue)
                    .padding(.horizontal, 20)
                    .frame(width: 400, height: 45)
                ZStack {
                    Circle()
                        .foregroundColor(.fusionred)
                        .frame(width: 60, height: 60)
                    // need to develop calculation
                    Text("\(recoveryScoreCalculation())")
                        .foregroundColor(.white)
                        .font(.title3.bold())
                }
                .padding(.horizontal)
                Text("Recovery Score")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)

            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.twinkleblue)
                    .padding(.horizontal, 20)
                    .frame(width: 400, height: 45)
                ZStack {
                    Circle()
                        .foregroundColor(.fusionred)
                        .frame(width: 60, height: 60)
                    Text("\(Int(pain))")
                        .foregroundColor(.white)
                        .font(.title3.bold())
                }
                .padding(.horizontal)
                Text("Pain Score")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
             */

            Spacer()
            
        }
    }
}

struct LoadCapacityPredictionView_Previews: PreviewProvider {
    static var previews: some View {
        LoadCapacityPredictionView(trainingHabits: .constant(TrainingHabit.sampleData), workoutInfo: .constant(WorkoutInfo.blankSampleData))
    }
}

func recoveryScoreCalculation(trainingHabits: [TrainingHabit]) -> Int {
    var total: Int = 0
    for num in 0...4 {
        total += Int((Double(trainingHabits[num].today) / Double(trainingHabits[num].goal)) * Double(100))
    }
    return total / 5
}
