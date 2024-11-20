//
//  SearchTextFieldView.swift
//  CryptoTrack
//
//  Created by Роман on 06.11.2024.
//

import SwiftUI

struct SearchTextFieldView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
            TextField("Search", text: $searchText)
                .colorScheme(.dark)
                .foregroundStyle(.white)
        }
        .padding()
        .background {
            Color.white.opacity(0.2)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        SearchTextFieldView(searchText: .constant(""))
    }
}
