//
//  HabitEntryModalView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/27/22.
//

import SwiftUI

struct EntryModalView: View {
        
    let entry: TrainingHabit
    
    func barHeightCalculation(day: Int) -> Int {
        return Int((Double(entry.lastWeek[day]) / Double(entry.goal)) * Double(75))
    }
    
    var body: some View {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 15) {
                    Text("\(entry.title)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    
                    HStack(spacing: 20) {
                        ForEach(0..<7) { day in
                            VStack {
                                Text("\(entry.lastWeek[day])\(entry.shortUnits)")
                                    .font(.body.bold())
                                    .padding(.bottom,-1)
                                BarView(value: barHeightCalculation(day: day), day: exampleDates[day])
                                Text("\(exampleDates[day])")
                                    .font(.caption.bold())
                                    .foregroundColor(.init(white: 0.9))
                            }
                            .foregroundColor(.white)
                        }
                    }

                    HStack {
                        HStack {
                            Text("Daily Goal: \(entry.goal) \(entry.units)")
                                .foregroundColor(.white)
                                .font(.subheadline.bold())
                            Spacer(minLength: 0)

                        }
                        /*
                         EditButton()
                            .buttonStyle(BorderedButtonStyle())
                            .foregroundColor(.white)
                            .font(.body.bold())
                            .background(Color.gloomypurple)
                            .cornerRadius(8)
                        */
                    }
                }
                .padding()
                .background(entry.palette.mainColor)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                
                Image(systemName: "\(entry.icon)")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding()
                    .foregroundColor(.white)
            }
            .padding()
    }
}

struct HabitEntryModalView_Previews: PreviewProvider {
    static var previews: some View {
        EntryModalView(entry: TrainingHabit.sampleData[0])
    }
}

struct BarView: View {
    var value: Int
    var day: String
        
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule()
                    .frame(width: 20, height:100)
                    .foregroundColor(Color(.white))
                Capsule()
                    .frame(width: 20, height: 75)
                    .foregroundColor(.twinkleblue)
                Capsule()
                    .frame(width: 20, height: CGFloat(value))
                    .foregroundColor(day == today ? .flirtacious: .highblue)
            }
        }
    }
}

struct MeasurementModalView: View {
        
    let measurement: Measurement
    
    func barHeightCalculation(day: Int) -> Int {
        return Int((Double(measurement.lastWeek[day]) / Double(measurement.goal)) * Double(75))
    }
    
    var body: some View {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 15) {
                    Text("\(measurement.title)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    
                    HStack(spacing: 20) {
                        ForEach(0..<7) { day in
                            VStack {
                                Text("\(measurement.lastWeek[day])\(measurement.shortUnits)")
                                    .font(.body.bold())
                                    .padding(.bottom,-1)
                                BarView(value: barHeightCalculation(day: day), day: exampleDates[day])
                                Text("\(exampleDates[day])")
                                    .font(.caption.bold())
                                    .foregroundColor(.init(white: 0.9))
                            }
                            .foregroundColor(.white)
                        }
                    }

                    HStack {
                        HStack {
                            Text("Daily Goal: \(measurement.goal) \(measurement.units)")
                                .foregroundColor(.white)
                                .font(.subheadline.bold())
                            Spacer(minLength: 0)

                        }
                    }
                }
                .padding()
                .background(measurement.palette.mainColor)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                
                Image(systemName: "\(measurement.icon)")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding()
                    .foregroundColor(.white)
            }
            .padding()
    }
}
