//
//  BarChartView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/23/22.
//


import SwiftUI

struct ChartAndDataView: View {
    
    let entries: [TrainingHabit]
    
    let exampleDates = ["5/1", "5/2", "5/3", "5/4", "5/5", "5/6", "5/7"]
        
    @State var selectedEntry = 0
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Summary")
                        .font(.title.bold())
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                    
                    Spacer()
                    
                    Picker(selection: $selectedEntry, label: Text("")) {
                        Text("\(TrainingHabit.sampleData[0].title)").tag(0)
                        Text("\(TrainingHabit.sampleData[1].title)").tag(1)
                        Text("\(TrainingHabit.sampleData[2].title)").tag(2)
                        Text("\(TrainingHabit.sampleData[3].title)").tag(3)
                        Text("\(TrainingHabit.sampleData[4].title)").tag(4)
                        Text("\(TrainingHabit.sampleData[5].title)").tag(5)
                    }
                    .padding(.horizontal)
                    .background(Color.bluegrey.opacity(0.15))
                    .cornerRadius(5)
                }
                .padding(.top,5)
                .padding(.horizontal, 30)
                .padding(.bottom, -5)
                
                HStack {
                    //Text("\(Entry.sampleData[selectedEntry].units)")
                    //    .frame(width: 80, height: 200)
                    //    .rotationEffect(Angle(degrees: -90))
                    //    .padding(Edge.Set.trailing, -40)
                    //    .padding(Edge.Set.leading, -20)
                    HStack(alignment: .bottom, spacing: 15) {
                        ForEach(0...6, id: \.self) { num in
                            BarView2(value: barHeightCalculation(entry: selectedEntry, day: num), day: num)
                        }
                        
                    }
                    .animation(.default, value: UUID())
                }
                
                List {
                    ForEach(0...6, id: \.self) { num in
                        HStack {
                            Text("\(exampleDates[num])")
                                .font(.body.bold())
                            Spacer()
                            Text("\(TrainingHabit.sampleData[selectedEntry].lastWeek[num])")
                                .font(.body.bold())
                                .foregroundColor(.highblue)
                            Text("\(TrainingHabit.sampleData[selectedEntry].units)")
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartAndDataView(entries: TrainingHabit.sampleData)
    }
}
 
struct BarView2: View {
    var value: Int
    var day: Int

    let days = ["M", "T", "W", "T", "F", "S", "S"]

    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule()
                   .frame(width: 30, height:200)
                    .foregroundColor(Color(.white))
                Capsule()
                    .frame(width: 30, height: 150)
                    .foregroundColor(.twinkleblue)
                Capsule()
                    .frame(width: 30, height: CGFloat(value))
                    .foregroundColor(.highblue)
            }
            Text("\(days[day])")
                .font(.body.bold())
        }
    }
}

func barHeightCalculation(entry: Int, day: Int) -> Int {
    return Int((Double(TrainingHabit.sampleData[entry].lastWeek[day]) / Double(TrainingHabit.sampleData[entry].goal)) * 150)
}
