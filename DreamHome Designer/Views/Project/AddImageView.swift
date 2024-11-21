//
//  AddImageView.swift
//  DreamHome Designer
//
//  Created by Роман on 21.11.2024.
//

import SwiftUI

struct AddImageView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: ProjectViewModel
    let project: Project
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                if vm.simplePhoto != .logo {
                    Image(uiImage: vm.simplePhoto)
                        .resizable()
                        .frame(height: 332)
                        .cornerRadius(20)
                }else{
                    Text("Add photo to your project")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                }
                HStack{
                    
                    //MARK: - Choose photo
                    Button {
                        vm.isPresentPhotoPicer = true
                    } label: {
                        Image(systemName: "plus.app.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.gray)
                    }
                    
                    //MARK: - Save button
                    if vm.simplePhoto != .logo {
                        Button {
                            vm.addPhoto(project: project)
                            dismiss()
                        } label: {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 48, height: 48)
                                .foregroundStyle(.green)
                        }
                    }
                }
            }.sheet(isPresented: $vm.isPresentPhotoPicer) {
                PhotoPicker(configuration: vm.config, pickerResult: $vm.simplePhoto, isPresented: $vm.isPresentPhotoPicer)
            }
        }
    }
}

#Preview {
    AddImageView(vm: ProjectViewModel(), project: Project())
}
