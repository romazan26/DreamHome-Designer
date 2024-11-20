//
//  SwiftUIView.swift
//  DreamHome Designer
//
//  Created by Роман on 20.11.2024.
//

import SwiftUI

struct SwitchTypeprojectView: View {
    @State private var type = 0
    var body: some View {
        HStack {
            Button {
                type = 0
            } label: {
                Text("All")
                    .foregroundStyle(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.white
                            .opacity(type == 0 ? 0.2 : 0)
                            .cornerRadius(12)
                    }
            }
            Button {
                type = 1
            } label: {
                Text("Interier")
                    .foregroundStyle(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.white
                            .opacity(type == 1 ? 0.2 : 0)
                            .cornerRadius(12)
                    }
            }
            Button {
                type = 2
            } label: {
                Text("Exterier")
                    .foregroundStyle(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.white
                            .opacity(type == 2 ? 0.2 : 0)
                            .cornerRadius(12)
                    }
            }

        }
        .background {
            Color.white
                .opacity(0.2)
                .cornerRadius(12)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        SwitchTypeprojectView()
    }
}
