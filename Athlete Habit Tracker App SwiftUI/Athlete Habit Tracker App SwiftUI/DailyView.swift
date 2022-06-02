//
//  ContentView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/18/22.
//

import Popovers
import SwiftUI

struct DailyView: View {
    
    @Binding var isPresentingInfoEditView: Bool
    @State var isPresentingSleepModalView = false
    @State var isPresentingHydrationModalView = false
    @State var isPresentingProteinModalView = false
    @State var isPresentingCalorieModalView = false
    @State var isPresentingStretchingModalView = false
    @State var isPresentingWorkoutModalView = false
    @State var isPresentingWeightModalView = false
    @State var isPresentingHeartRateModalView = false

    @State var isPresentingEntryInputView = false
    @ObservedObject var traceOptionsObject = TraceOptionsDataObject(detail: true, date: Date())
    //let entries: [Entry]
   // let measurements: [Measurement]
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        VStack {
            // if values are inputted, card will light up
            // if havent inputted yet, card will be grey
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    
                    EntryCardView(isPresentingModalView: $isPresentingSleepModalView, entry: traceOptionsObject.optionsArray[0])
                    EntryCardView(isPresentingModalView: $isPresentingHydrationModalView, entry: traceOptionsObject.optionsArray[1])
                    EntryCardView(isPresentingModalView: $isPresentingProteinModalView, entry: traceOptionsObject.optionsArray[2])
                    EntryCardView(isPresentingModalView: $isPresentingCalorieModalView, entry: traceOptionsObject.optionsArray[3])
                    EntryCardView(isPresentingModalView: $isPresentingStretchingModalView, entry: traceOptionsObject.optionsArray[4])
                    EntryCardView(isPresentingModalView: $isPresentingWorkoutModalView, entry: traceOptionsObject.optionsArray[5])
                    MeasurementCardView(isPresentingModalView: $isPresentingWeightModalView, measurement: traceOptionsObject.optionsArray[6])
                    MeasurementCardView(isPresentingModalView: $isPresentingHeartRateModalView, measurement: traceOptionsObject.optionsArray[7])

                    
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
        }
        .overlay(
                Button(action: {
                    isPresentingEntryInputView = true
                }) {
                    Image(systemName: "pencil")
                }
                    .font(.system(size: 25).bold())
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .background(Color.highblue)
                    .clipShape(Circle())
                    .padding()
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                , alignment: .bottomTrailing)
        .sheet(isPresented: $isPresentingEntryInputView) {
            NavigationView {
                EntryInputView(traceOptionsObject:traceOptionsObject)
                    .navigationTitle("Input Info")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEntryInputView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                traceOptionsObject.commitToOptionsDetailDB()
                                isPresentingEntryInputView = false
                            }
                        }
                    }
            }
        }
    }
}

//struct DailyView_Previews: PreviewProvider {
  //  static var previews: some View {
  //      DailyView(isPresentingInfoEditView: .constant(true), entries: Entry.sampleData, measurements: Measurement.sampleData)
  //  }
//}

func recoveryScoreCalculation() -> Int {
    var total: Int = 0
    for entry in Entry.sampleData {
        total += Int((Double(entry.lastWeek[0]) / Double(entry.goal)) * Double(100))
    }
    return total / Entry.sampleData.count
}

struct EntryCardView: View {
    
    @Binding var isPresentingModalView: Bool
    
    var entry: TraceOptionsDataModel
    
    var body: some View {
        Button(action: {
            isPresentingModalView = true
        }) {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(alignment: .leading, spacing: 15) {
                    Text("\(entry.title)")
                        .foregroundColor(.white)
                    
                    Text("\(entry.getDetailScore(date: Date())) \(entry.unit)")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    HStack {
                        Text("Goal: \(entry.goal) \(entry.unit)")
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
        .popover(present: $isPresentingModalView) {
            EntryModalView(entry: entry)
        }
    }
}

struct MeasurementCardView: View {
    
    @Binding var isPresentingModalView: Bool
    
    var measurement: TraceOptionsDataModel
    
    var body: some View {
        Button(action: {
            isPresentingModalView = true
        }) {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(alignment: .leading, spacing: 15) {
                    Text("\(measurement.title)")
                        .foregroundColor(.white)
                    
                    Text("\(measurement.lastWeek[0]) \(measurement.shortUnits)")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    HStack {
                        Text("Goal: \(measurement.goal) \(measurement.unit)")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        Spacer(minLength: 0)
                        
                    }
                }
                .padding()
                .background(measurement.palette.mainColor)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                
                Image(systemName: "\(measurement.icon)")
                    .padding()
                    .foregroundColor(.white)
            }
        }
        .popover(present: $isPresentingModalView) {
            MeasurementModalView(measurement: measurement)
        }
    }
}
