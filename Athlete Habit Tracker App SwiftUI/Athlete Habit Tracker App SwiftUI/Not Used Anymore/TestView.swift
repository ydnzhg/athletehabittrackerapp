//
//  TestView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/28/22.
//

import Popovers
import SwiftUI

struct TestView: View {
    @State var present = false

    var body: some View {
        Button("Present popover!") {
                    present = true
        }
        .popover(present: $present) {
            Text("Hi, I'm a popover.")
                .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(16)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
