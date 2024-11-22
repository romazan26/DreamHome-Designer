//
//  ProjectsView.swift
//  DreamHome Designer
//
//  Created by Роман on 20.11.2024.
//

import SwiftUI

struct ProjectsView: View {
    @StateObject var vm: ProjectViewModel
    @FocusState var isFocusedKeyboard: Bool
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 15) {
                //MARK: - Search Project text field
                SearchTextFieldView(searchText: $vm.searchText)
                    .focused($isFocusedKeyboard)
                
                //MARK: - Switch type
                SwitchTypeprojectView(vm: vm)
                
                //MARK: - List Projects
                ScrollView {
                    if vm.projects.isEmpty {
                        Text("You don't have any projects yet")
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .padding(50)
                    }else{
                        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 10) {
                            ForEach(vm.filteredProjects) { project in
                                NavigationLink {
                                    ProjectView(project: project, vm: vm)
                                } label: {
                                    ProjectCellView(project: project)
                                }
                            }
                        }
                    }
                }
                Spacer()
                
                NavigationLink {
                    ProjectCreateView(vm: vm)
                } label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(.yellowApp)
                }
            }.padding()
        }
        .onTapGesture {
            isFocusedKeyboard = false
        }
    }
}

#Preview {
    ProjectsView(vm: ProjectViewModel())
}
