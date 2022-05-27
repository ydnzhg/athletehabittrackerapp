//
//  ContentView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/18/22.
//

import SwiftUI

struct DailyView: View {
    let entries: [Entry]
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        VStack {
            // day navigation
            DayNavigationView(date: "Today")
                .padding(.top,5)
                .padding(.bottom, -1)
                        
            // if values are inputted, card will light up
            // if havent inputted yet, card will be grey
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(entries) { entry in
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                            VStack(alignment: .leading, spacing: 15) {
                                Text("\(entry.title)")
                                    .foregroundColor(.white)
                                
                                Text("\(entry.lastWeek[0]) \(entry.units)")
                                    .font(.title.bold())
                                    .foregroundColor(.white)
                        
                                HStack {
                                    Text("Goal: \(entry.goal) \(entry.units)")
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                    Spacer(minLength: 0)

                                }
                            }
                            .padding()
                            .background(entry.palette.mainColor)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            
                            Image(systemName: "\(entry.icon)")
                                .padding()
                                .foregroundColor(.white)
                        }
                    }
                    
                    // example of a card with no input yet
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Example")
                                .foregroundColor(.white)
                            
                            Text("...")
                                .font(.title.bold())
                                .foregroundColor(.white)
                    
                            HStack {
                                Text("Goal: 100")
                                    .foregroundColor(.white)
                                Spacer(minLength: 0)

                            }
                        }
                        .padding()
                        .background(Color.twinkleblue)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        
                        Image(systemName: "person.fill")
                            .padding()
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
                .padding(.top,5)
            }
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.twinkleblue)
                    .padding(.horizontal, 20)
                    .frame(width: 400, height: 50)
                ZStack {
                    Circle()
                        .foregroundColor(.fusionred)
                        .frame(width: 75, height: 70)
                    // need to develop calculation
                    Text("\(recoveryScoreCalculation())")
                        .foregroundColor(.white)
                        .font(.title3.bold())
                }
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)

                .padding(.horizontal)
                Text("Recovery Score")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.bottom, -10)
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView(entries: Entry.sampleData)
    }
}

func recoveryScoreCalculation() -> Int {
    var total: Int = 0
    for entry in Entry.sampleData {
        total += Int((Double(entry.lastWeek[0]) / Double(entry.goal)) * Double(100))
    }
    return total / Entry.sampleData.count
}
