//
//  EntryView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/22/22.
//

import SwiftUI

struct EntryView: View {
    let entries: [Entry]
    var body: some View {
        // habits and measurements
        List {
            Section(header: Text("Habits")) {
                ForEach(entries) { entry in
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "checkmark.circle")
                        }
                        VStack(alignment: .leading) {
                            Text(entry.title)
                                .font(.headline)
                            Spacer()
                            HStack {
                                Label("Goal: \(entry.goal) \(entry.units)", systemImage: "\(entry.icon)")
                            }
                            .font(.footnote)
                        }
                        .padding(5)
                    }
                }
            }
        }
    }
}

struct EntryView_Previews: PreviewProvider {
    static var entry = Entry.sampleData[0]
    static var previews: some View {
        EntryView(entries: Entry.sampleData)
            .previewLayout(.fixed(width: 400, height: 600))
    }
}
