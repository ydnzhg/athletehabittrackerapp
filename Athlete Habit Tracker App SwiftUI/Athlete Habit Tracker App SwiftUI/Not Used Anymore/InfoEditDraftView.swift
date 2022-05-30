//
//  InitialLaunchView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/28/22.
//

import SwiftUI

struct InfoEditDraftView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var age = 0.0
    @State private var gender = 0
    @State private var heightFeet = 0
    @State private var heightInches = 0
    @State private var weight = 0.0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    HStack {
                        Text("Age")
                        Spacer(minLength: 40)
                        Slider(value: $age, in: 0...100, step: 1) {
                            Text("years")
                        }
                        Text("\(Int(age)) yrs")
                    }
                    HStack {
                        Text("Gender")
                        Spacer()
                        Picker("Gender", selection: $gender) {
                            Text("Choose").tag(0)
                            Text("Male").tag(1)
                            Text("Female").tag(2)
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                Section(header: Text("Measurements")) {
                    HStack {
                        Text("Height")
                        Spacer()
                        Picker("Feet", selection: $heightFeet) {
                            Text("Choose").tag(0)
                            ForEach(1..<9) { num in
                                Text("\(num)").tag("\(num)")
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        Text("ft")
                        Picker("Inches", selection: $heightInches) {
                            Text("Choose").tag(0)
                            ForEach(0..<12) { num in
                                Text("\(num)").tag("\(num)")
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        Text("in")
                    }
                    HStack {
                        Text("Weight")
                        Spacer(minLength: 40)
                        Slider(value: $weight, in: 0...300, step: 5) {
                            Text("lbs")
                        }
                        Text("\(Int(weight)) lbs")
                    }
                }
            }
        }
    }
}

struct InfoEditDraft0View_Previews: PreviewProvider {
    static var previews: some View {
        InfoEditDraftView()
    }
}
