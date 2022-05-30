//
//  LoadCapacityPredictionView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/27/22.
//

import SwiftUI

struct LoadCapacityPredictionView: View {
    @Binding var intensity: Double
    @Binding var sets: Int
    @Binding var pain: Double
    
    var body: some View {
        VStack {
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

            Spacer()
            
        }
    }
}

struct LoadCapacityPredictionView_Previews: PreviewProvider {
    static var previews: some View {
        LoadCapacityPredictionView(intensity: .constant(0), sets: .constant(0), pain: .constant(0))
    }
}
