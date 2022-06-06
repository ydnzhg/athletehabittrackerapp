//
//  RehabView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/25/22.
//

import SwiftUI

struct RehabView: View {
    //@State private var didWorkout = 1
    //@State private var partOfBody = 1
    //@State private var intensity = 0.0
    //@State private var sets = 0
    //@State private var pain = 0.0
    //add by yejf
    @ObservedObject var rehabDataObject : RehabDataObject
    var body: some View {
        ScrollView {
            VStack {
                
                
                
                WorkoutQuestion(selection: $rehabDataObject.didWorkout)
                
                BodyPartQuestion(selection: $rehabDataObject.partOfBody)
                
                SetsAndIntensityQuestion(sets: $rehabDataObject.sets, intensity: $rehabDataObject.intensity)
                
                PainQuestion(pain: $rehabDataObject.pain)
            }
        }
    }
}

struct RehabView_Previews: PreviewProvider {
    static var previews: some View {
        RehabView(rehabDataObject:RehabDataObject(date:Date()))
    }
}

struct WorkoutQuestion: View {
    @Binding var selection: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.highblue)
                .padding()
                .frame(width: 400, height: 135)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            VStack {
                Text("Did you workout today?")
                    .foregroundColor(.white)
                    .font(.title3.bold())
                    .padding(5)
                Picker(selection: $selection, label: Text("Picker")) {
                    Text("Yes").tag(0)
                    Text("No").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
            }
            .padding()
        }
        .padding(.bottom, -15)
    }
}

struct BodyPartQuestion: View {
    @Binding var selection: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .padding()
                .foregroundColor(.fusionred)
                .frame(width: 400, height: 135)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            VStack {
                Text("Which body part did you workout?")
                    .foregroundColor(.white)
                    .font(.title3.bold())
                    .padding(5)
                Picker(selection: $selection, label: Text("Picker")) {
                    Text("Upper").tag(0)
                    Text("Lower").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
            }
            .padding()
        }
        .padding(.bottom, -15)
    }
}

struct SetsAndIntensityQuestion: View {
    @Binding var sets: Int
    @Binding var intensity: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.reptilegreen)
                .padding()
                .frame(width: 400, height: 190)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            VStack {
                Text("What was the number of sets and the intensity?")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.title3.bold())
                    .padding(.top,5)
                VStack {
                    HStack {
                        Text("\(sets) sets")
                            .foregroundColor(.white)
                            .font(.body.bold())
                        Stepper(value: $sets, in: 0...10) {
                        }
                    }
                    HStack {
                        Text("\(Int(intensity)) RPE")
                            .foregroundColor(.white)
                            .font(.body.bold())
                        Spacer(minLength: 20)
                        Slider(value: $intensity, in: 0...10, step: 1) {
                            Text("RPE")
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 5)
            }
            .padding()
        }
        .padding(.bottom, -15)
    }
}

struct PainQuestion: View {
    
    @Binding var pain: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.orangehibiscus)
                .padding()
                .frame(width: 400, height: 135)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            VStack {
                Text("How much pain were you in?")
                    .foregroundColor(.white)
                    .font(.title3.bold())
                    .padding(5)
                HStack {
                    Text("\(Int(pain))")
                        .foregroundColor(.white)
                        .font(.body.bold())
                    Spacer(minLength: 20)
                    Slider(value: $pain, in: 0...10, step: 1) {
                        Text("RPE")
                    }
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}
