//
//  ImageProjectView.swift
//  DreamHome Designer
//
//  Created by Роман on 21.11.2024.
//

import SwiftUI

struct ImageProjectView: View {
    @StateObject var vm: ProjectViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea().opacity(0.5)
            VStack {
                //MARK: - Close button
                HStack {
                    Spacer()
                    Button {
                        vm.isPresentImage = false
                    } label: {
                        Image(systemName: "xmark.app.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.gray)
                    }
                }

                
                Image(uiImage: vm.simpleImage?.photo ?? .logo)
                    .resizable()
                    .frame(height: 332)
                    .cornerRadius(20)
                
                Button {
                    vm.deleteImage()
                } label: {
                    Image(systemName: "trash.square.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(.red)
                }

            }
            .padding()
        }
    }
}

#Preview {
    ImageProjectView(vm: ProjectViewModel())
}
