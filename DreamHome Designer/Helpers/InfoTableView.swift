//
//  InfoTableView.swift
//  DreamHome Designer
//
//  Created by Роман on 19.11.2024.
//

import SwiftUI

struct InfoTableView: View {
    var body: some View {
        VStack {
            infoTableButtonView(text: "Added project", text2: "0")
            HStack {
                infoTableButtonView(text: "Interiors", text2: "0")
                infoTableButtonView(text: "Exteriors", text2: "0")
            }
            infoTableButtonView(text: "The notes are written", text2: "0")
        }
    }
}

#Preview {
    InfoTableView()
}
