//
//  InfoEditView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/29/22.
//

import SwiftUI

struct InfoEditView: View {
    
    @Binding var userData: User.Data
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            NameEditTextField(image: "signature", label: "Name: ", value: $userData.name)
            
            GenderPicker(image: "person.fill", label: "Gender: ", value: $userData.gender)
            
            InfoEditTextField(image: "calendar", placeholder: "Age: ", units: "yrs",value: $userData.age)
            
            InfoEditTextField(image: "ruler.fill", placeholder: "Height: ", units: "in", value: $userData.height)
            
            InfoEditTextField(image: "scalemass.fill", placeholder: "Weight: ", units: "lbs", value: $userData.weight)

            Spacer()
        }
        .padding(.horizontal, 5)
    }
}


struct InfoEditView_Previews: PreviewProvider {
    static var previews: some View {
        InfoEditView(userData: .constant(User.sampleData.data))
    }
}


struct NameEditTextField: View {
    
    var image: String
    var label: String
    
    @Binding var value: String
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Image(systemName: image)
                .font(.system(size: 25))
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(Color.fusionred)
                .clipShape(Circle())
            TextField(label, text: $value)
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
                    .foregroundColor(Color.black.opacity(0.7))
                Spacer()
                Picker(label, selection: $value) {
                    Text("Male").tag(0)
                    Text("Female").tag(1)
                }
                .frame(width: 135)
                .pickerStyle(SegmentedPickerStyle())
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

struct InfoEditTextField: View {
    
    var image: String
    var placeholder: String
    var units: String
    
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
                Text(placeholder)
                    .foregroundColor(Color.black.opacity(0.7))
                Spacer()
                TextField("info", value: $value, format: .number)
                    .font(.body.bold())
                    .foregroundColor(.highblue)
                    .frame(width: 30)
                Text(units)
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding(.trailing,10)
                    .frame(width: 40)
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

/*
NameTextField(image: "signature", placeholder: "Name", value: $userData.name)
    .padding(.top, 10)
GenderPicker(image: "person.fill", label: "Gender", value: $userData.gender)
AgeSlider(image: "calendar", label: "Age", units: "yrs", value: $userData.age)
HeightPicker(image: "ruler.fill", label: "Height", value: $userData.height)
WeightSlider(image: "scalemass.fill", label: "Weight", units: "lbs", value: $userData.weight)



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
                    .foregroundColor(Color.black.opacity(0.7))
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
                Text("Height")
                    .foregroundColor(Color.black.opacity(0.7))
                Spacer()
                Picker("Inches", selection: $value) {
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
                    .foregroundColor(Color.black.opacity(0.7))
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
*/
