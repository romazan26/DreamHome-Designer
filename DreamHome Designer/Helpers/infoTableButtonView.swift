//
//  infoTableButtonView.swift
//  DreamHome Designer
//
//  Created by Роман on 19.11.2024.
//

import SwiftUI

struct infoTableButtonView: View {
    let text: String
    let text2: String
    var body: some View {
        VStack(spacing: 10) {
            Text(text)
                .foregroundStyle(.black)
                .font(.system(size: 17))
                
            Text(text2)
                .foregroundStyle(.black)
                .font(.system(size: 28))
        }
        .frame(height: 76)
        .frame(maxWidth: .infinity)
        .padding(10)
        .background {
            Color.yellowApp.cornerRadius(12)
            
        }
    }
}

#Preview {
    infoTableButtonView(text: "Added progect", text2: "0")
}
