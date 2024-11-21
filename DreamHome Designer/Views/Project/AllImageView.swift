//
//  AllImageView.swift
//  DreamHome Designer
//
//  Created by Роман on 20.11.2024.
//

import SwiftUI

struct AllImageView: View {
    @ObservedObject var project: Project
    @StateObject var vm: ProjectViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                //MARK: - Name project
                Text(project.name ?? "")
                    .foregroundStyle(.white)
                    .font(.title2)
                
                //MARK: - Image for project
                if let images = project.photo?.allObjects as? [PhotoProject] {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(images) { image in
                            Button {
                                vm.isPresentImage = true
                                vm.simpleImage = image
                            } label: {
                                Image(uiImage: image.photo ?? .logo)
                                    .resizable()
                                    .frame(width: 171, height: 110)
                                    .cornerRadius(20)
                            }
                        }
                    }
                }
                
                Spacer()
                Button {
                    vm.isPresentAddImage = true
                } label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(.yellowApp)
                }

            }.sheet(isPresented: $vm.isPresentAddImage) {
                AddImageView(vm: vm, project: project)
            }
            
            //MARK: - Image view
            if vm.isPresentImage {
                ImageProjectView(vm: vm)
            }
        }
    }
}

#Preview {
    AllImageView(project: Project(), vm: ProjectViewModel())
}
