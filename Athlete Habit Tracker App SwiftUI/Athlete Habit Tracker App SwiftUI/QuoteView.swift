//
//  QuoteView.swift
//  Athlete Habit Tracker App SwiftUI
//
//  Created by Zhang, Xiaodong on 5/25/22.
//

import SwiftUI

struct QuoteView: View {
    var body: some View {
            HStack {
                Image(systemName: "quote.opening")
                    .foregroundColor(.white)

                Text("Today, you endure suffering.\nTomorrow, you'll stand out.")
                    .multilineTextAlignment(.center)
                    .font(.headline.bold().italic())
                    .foregroundColor(.white)
                Image(systemName: "quote.closing")
                    .foregroundColor(.white)
            }
            .padding(10)
            .background(.linearGradient(Gradient(colors: [.bluegrey, Color.indigo]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
