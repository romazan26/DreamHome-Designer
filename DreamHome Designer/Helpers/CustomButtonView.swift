//
//  CustomButtonView.swift
//  Betting calculator
//
//  Created by Роман on 15.10.2024.
//

import SwiftUI

struct CustomButtonView: View {
    var title = "Next"
    var color: Color = .yellowApp
    var body: some View {
        ZStack {
            color.cornerRadius(12)
            Text(title)
                .foregroundStyle(.white)
                .font(.system(size: 17))
        }.frame(height: 38)
            .frame(maxWidth: 70)
    }
}

#Preview {
    CustomButtonView()
}
