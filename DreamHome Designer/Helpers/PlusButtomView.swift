//
//  PlusButtomView.swift
//  DreamHome Designer
//
//  Created by Роман on 20.11.2024.
//

import SwiftUI

struct PlusButtomView: View {
    var body: some View {
        ZStack {
            Color.white.opacity(0.1)
                .cornerRadius(10)
            Image(systemName: "plus")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(.white)
        }.frame(width: 48, height: 150)
    }
}

#Preview {
    PlusButtomView()
}
