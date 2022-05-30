//
//  EntryInputView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/30/22.
//

import SwiftUI

struct EntryInputView: View {
    
    let entries: [Entry]
    let measurements: [Measurement]
    
    @State private var sleep = 0
    @State private var drink = 0
    @State private var protein = 0
    @State private var calories = 0
    @State private var stretch = 0
    @State private var workout = 0
    @State private var currentWeight = 0
    @State private var currentHeartRate = 0
    
    var body: some View {
        VStack(spacing: 15) {
            EntryTextField(entry: entries[0], placeholder: "Hours of Sleep", value: $sleep)
            EntryTextField(entry: entries[1], placeholder: "Amount of Water", value: $drink)
            EntryTextField(entry: entries[2], placeholder: "Protein Consumed", value: $protein)
            EntryTextField(entry: entries[3], placeholder: "Calories Consumed", value: $calories)
            EntryTextField(entry: entries[4], placeholder: "Stretching Time", value: $stretch)
            EntryTextField(entry: entries[5], placeholder: "Workout Time", value: $workout)
            MeasurementTextField(measurement: measurements[0], placeholder: "Current Weight", value: $currentWeight)
            MeasurementTextField(measurement: measurements[1], placeholder: "Current Heart Rate", value: $currentHeartRate)
        }
    }
}

struct EntryInputView_Previews: PreviewProvider {
    static var previews: some View {
        EntryInputView(entries: Entry.sampleData, measurements: Measurement.sampleData)
    }
}

struct EntryTextField: View {
    
    var entry: Entry
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
                TextField("\(entry.units)", value: $value, format: .number)
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
    
    var measurement: Measurement
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
                TextField("\(measurement.units)", value: $value, format: .number)
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
