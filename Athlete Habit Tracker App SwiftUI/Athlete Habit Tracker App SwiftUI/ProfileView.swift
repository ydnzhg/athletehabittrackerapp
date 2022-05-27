//
//  ProfileView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/24/22.
//

import SwiftUI

struct ProfileView: View {
    let user: User

    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle.bold())
                .padding()
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
            VStack {
                Image(user.profilePicture)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                Text(user.name)
                    .font(.title.bold())
                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
            }
                        
            Spacer(minLength: 10)
            
            HStack(spacing: 50) {
                VStack {
                    Text("\(user.height) in")
                        .font(.title2.bold())
                        .foregroundColor(.highblue)
                    Text("Height")
                        .foregroundColor(.bluegrey)
                }
                VStack {
                    Text("\(user.weight) lbs")
                        .font(.title2.bold())
                        .foregroundColor(.highblue)
                    Text("Weight")
                        .foregroundColor(.bluegrey)
                }
            }
            .padding(.top, 5)
            .padding(.bottom, 15)
            
            List {
                HStack {
                    Label("Edit User Information", systemImage: "pencil.circle.fill")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                HStack {
                    Label("Change Daily Goals", systemImage: "flag.2.crossed.fill")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                HStack {
                    Label("Set New Quote", systemImage: "quote.closing")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
    
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.sampleData)
    }
}
