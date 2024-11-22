//
//  Untitled.swift
//  DreamHome Designer
//
//  Created by Роман on 20.11.2024.
//

import SwiftUI

struct ProjectCreateView: View {
    @StateObject var vm: ProjectViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState var isFocused: Bool
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                //MARK: - Project name
                HStack{
                    Text("Projectname")
                        .foregroundStyle(.white)
                    TextField("Your project name", text: $vm.simpleNameProject)
                        .colorScheme(.dark)
                        .focused($isFocused)
                    }
                
                //MARK: - Project style
                HStack {
                    Text("Choose style: ")
                        .foregroundStyle(.white)
                    Spacer()
                    Picker("Style project", selection: $vm.simpleStyle) {
                        ForEach(Style.allCases, id: \.self) { type in
                            Text(type.rawValue)
                            
                        }
                    }
                }
                
                //MARK: - Project type
                HStack {
                    Text("Choose type: ")
                        .foregroundStyle(.white)
                    Spacer()
                    Picker("Type project", selection: $vm.simpleType) {
                        ForEach(TypeProject.allCases, id: \.self) { type in
                            Text(type.rawValue)
                            
                        }
                    }
                }
                
                Spacer()
                
                HStack {
                    //MARK: - Close button
                    Button {
                        vm.clearProjectData()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.square.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.gray)
                    }
                    
                    //MARK: - Add button
                    Button {
                        if vm.isEditeProjectMode {
                            vm.editProjectData()
                        }else{
                            vm.addProject()
                        }
                        
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark.square.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.yellowApp)
                    }
                }

            }
            .padding()
            .navigationTitle("Create Project")
            
        }
        .onTapGesture {
            isFocused = false
        }
    }
}

#Preview {
    ProjectCreateView(vm: ProjectViewModel())
}
