//
//  SettingButtonView.swift
//  CryptoTrack
//
//  Created by Роман on 07.11.2024.
//

import SwiftUI

struct SettingButtonView: View {
            var text = ""
            var body: some View {
                    HStack {
                        Text(text)
                            .foregroundStyle(.white)
                            .font(.system(size: 17, weight: .bold))
                            .padding(.horizontal)
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 12, height: 22)
                            .foregroundStyle(.blue)
                    }
                    .padding()
                
                .frame(height: 56)
                .frame(maxWidth: .infinity)
            }
        }
    


#Preview {
    ZStack {
        Color.black
        SettingButtonView()
    }
}
