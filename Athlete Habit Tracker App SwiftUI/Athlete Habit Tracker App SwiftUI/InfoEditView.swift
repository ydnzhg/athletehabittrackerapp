//
//  InfoEditView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/29/22.
//

import SwiftUI

struct InfoEditView: View {
    
    @State private var nameEx = ""
    @State private var genderEx = 0
    @State private var ageEx = 0.0
    @State private var heightFeetEx = 0
    @State private var heightInchesEx = 0
    @State private var weightEx = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            NameTextField(image: "signature", placeholder: "Name", value: $nameEx)
                .padding(.top, 10)
            GenderPicker(image: "person.fill", label: "Gender", value: $genderEx)
            AgeSlider(image: "calendar", label: "Age", units: "yrs", value: $ageEx)
            HeightPicker(image: "ruler.fill", label: "Height", value1: $heightFeetEx, value2: $heightInchesEx)
            WeightSlider(image: "scalemass.fill", label: "Weight", units: "lbs", value: $weightEx)
            Spacer()
        }
    }
}

struct InfoEditView_Previews: PreviewProvider {
    static var previews: some View {
        InfoEditView()
    }
}

struct NameTextField: View {
    
    var image: String
    var placeholder: String
    @Binding var value: String
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Image(systemName: image)
                .font(.system(size: 25))
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(Color.fusionred)
                .clipShape(Circle())
            TextField(placeholder, text: $value)
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

struct GenderPicker: View {
    
    var image: String
    var label: String
    @Binding var value: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Image(systemName: image)
                .font(.system(size: 25))
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(Color.fusionred)
                .clipShape(Circle())
            HStack {
                Text(label)
                    .foregroundColor(Color.gray)
                Spacer()
                Picker(label, selection: $value) {
                    Text("Choose").tag(0)
                    Text("Male").tag(1)
                    Text("Female").tag(2)
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            .padding(.leading, 60)
            .padding(.trailing, 10)
            .frame(height: 60)
            .background(Color.bluegrey.opacity(0.1))
            .clipShape(Capsule())
        }
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

struct AgeSlider: View {
    
    var image: String
    var label: String
    var units: String
    @Binding var value: Double
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Image(systemName: image)
                .font(.system(size: 25))
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(Color.fusionred)
                .clipShape(Circle())
            HStack {
                Text(label)
                    .foregroundColor(Color.gray)
                Spacer(minLength: 30)
                Slider(value: $value, in: 0...100, step: 1) {
                    Text("years")
                }
                Text("\(Int(value)) \(units)")
                    .foregroundColor(Color.gray)
            }
            .padding()
            .padding(.leading, 60)
            .padding(.trailing, 10)
            .frame(height: 60)
            .background(Color.bluegrey.opacity(0.1))
            .clipShape(Capsule())
        }
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

struct HeightPicker: View {
    
    var image: String
    var label: String
    @Binding var value1: Int
    @Binding var value2: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Image(systemName: image)
                .font(.system(size: 25))
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(Color.fusionred)
                .clipShape(Circle())
            HStack {
                Text("Height")
                    .foregroundColor(Color.gray)
                Spacer()
                Picker("Feet", selection: $value1) {
                    Text("Choose").tag(0)
                    ForEach(1..<9) { num in
                        Text("\(num)").tag("\(num)")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                Text("ft")
                    .foregroundColor(Color.gray)
                Picker("Inches", selection: $value2) {
                    Text("Choose").tag(0)
                    ForEach(0..<12) { num in
                        Text("\(num)").tag("\(num)")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                Text("in")
                    .foregroundColor(Color.gray)
            }
            .padding()
            .padding(.leading, 60)
            .padding(.trailing, 10)
            .frame(height: 60)
            .background(Color.bluegrey.opacity(0.1))
            .clipShape(Capsule())
        }
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

struct WeightSlider: View {
    
    var image: String
    var label: String
    var units: String
    @Binding var value: Double
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Image(systemName: image)
                .font(.system(size: 25))
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(Color.fusionred)
                .clipShape(Circle())
            HStack {
                Text(label)
                    .foregroundColor(Color.gray)
                Spacer(minLength: 10)
                Slider(value: $value, in: 0...300, step: 5) {
                    Text("years")
                }
                Text("\(Int(value)) \(units)")
                    .foregroundColor(Color.gray)
            }
            .padding()
            .padding(.leading, 60)
            .padding(.trailing, 10)
            .frame(height: 60)
            .background(Color.bluegrey.opacity(0.1))
            .clipShape(Capsule())
        }
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
