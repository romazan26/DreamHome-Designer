//
//  NoteCellView.swift
//  DreamHome Designer
//
//  Created by Роман on 21.11.2024.
//

import SwiftUI

struct NoteCellView: View {
    @ObservedObject var note: NoteProject
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title ?? "")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
            Text(note.text ?? "")
                .foregroundStyle(.white)
                .font(.system(size: 17))
                .multilineTextAlignment(.leading)
        }
        .frame(width: 168, height: 110)
        .padding(8)
        .background {
            Color.black.cornerRadius(20)
        }
    }
}


