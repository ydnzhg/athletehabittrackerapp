//
//  EntryInputView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/30/22.
//

import SwiftUI

struct EntryInputView: View {
    
    //let entries: [Entry]
    //let measurements: [Measurement]
    @ObservedObject var traceOptionsObject : TraceOptionsDataObject
    //@State private var sleep = 0
    //@State private var drink = 0
    //@State private var protein = 0
   // @State private var calories = 0
   // @State private var stretch = 0
    //@State private var workout = 0
   // @State private var currentWeight = 0
   // @State private var currentHeartRate = 0
    
    var body: some View {
        VStack(spacing: 15) {
            EntryTextField(entry: traceOptionsObject.optionsArray[0], placeholder: "Hours of Sleep", value: $traceOptionsObject.sleep)
            EntryTextField(entry: traceOptionsObject.optionsArray[1], placeholder: "Amount of Water", value: $traceOptionsObject.hydration)
            EntryTextField(entry: traceOptionsObject.optionsArray[2], placeholder: "Protein Consumed", value: $traceOptionsObject.protein)
            EntryTextField(entry: traceOptionsObject.optionsArray[3], placeholder: "Calories Consumed", value: $traceOptionsObject.calorie)
            EntryTextField(entry: traceOptionsObject.optionsArray[4], placeholder: "Stretching Time", value: $traceOptionsObject.stretching)
            EntryTextField(entry: traceOptionsObject.optionsArray[5], placeholder: "Workout Time", value: $traceOptionsObject.workout)
            MeasurementTextField(measurement: traceOptionsObject.optionsArray[6], placeholder: "Current Weight", value:$traceOptionsObject.weight)
            MeasurementTextField(measurement: traceOptionsObject.optionsArray[7], placeholder: "Current Heart Rate", value: $traceOptionsObject.heartrate)
        }
    }
}

struct EntryInputView_Previews: PreviewProvider {
    static var previews: some View {
        EntryInputView(traceOptionsObject:TraceOptionsDataObject())
    }
}

struct EntryTextField: View {
    
    var entry: TraceOptionsDataModel
    var placeholder: String

    @Binding var value: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Image(systemName: entry.icon)
                .font(.system(size: 25))
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(entry.palette.mainColor)
                .clipShape(Circle())
            HStack {
                Text("\(placeholder): ")
                    .foregroundColor(.gray)
                Spacer()
                TextField("\(entry.unit)", value: $value, format: .number)
                    .frame(width: 100)
            }
            .padding()
            .padding(.leading, 60)
            .frame(height: 60)
            .background(Color.bluegrey.opacity(0.1))
            .clipShape(Capsule())
        }
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

struct MeasurementTextField: View {
    
    var measurement: TraceOptionsDataModel
    var placeholder: String

    @Binding var value: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Image(systemName: measurement.icon)
                .font(.system(size: 25))
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(measurement.palette.mainColor)
                .clipShape(Circle())
            HStack {
                Text("\(placeholder): ")
                    .foregroundColor(.gray)
                Spacer()
                TextField("\(measurement.unit)", value: $value, format: .number)
                    .frame(width: 100)
            }
            .padding()
            .padding(.leading, 60)
            .frame(height: 60)
            .background(Color.bluegrey.opacity(0.1))
            .clipShape(Capsule())
        }
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
