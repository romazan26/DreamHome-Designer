//
//  ProjectView.swift
//  DreamHome Designer
//
//  Created by Роман on 20.11.2024.
//

import SwiftUI

struct ProjectView: View {
    @ObservedObject var project: Project
    @StateObject var vm: ProjectViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                
                HStack {
                    //MARK: - Style
                    Text(project.style ?? "")
                        .foregroundStyle(.black)
                        .padding(8)
                        .background {
                            Color.yellowApp
                                .cornerRadius(10)
                        }
                    
                    //MARK: - Type
                    Text(project.type ?? "")
                        .foregroundStyle(.gray)
                        .padding(8)
                        .background {
                            Color.white
                                .opacity(0.1)
                                .cornerRadius(10)
                        }
                    
                    Spacer()
                }
                
                //MARK: - Title project
                HStack {
                    Text(project.name ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 22, weight: .heavy))
                    Spacer()
                }.padding(.top, 20)
                
                //MARK: - Photo project
                HStack{
                    NavigationLink {
                        AllImageView(project: project, vm: vm)
                    } label: {
                        PlusButtomView()
                    }
                    if let photos = project.photo?.allObjects as? [PhotoProject]{
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(photos.prefix(3)) { project in
                                    Image(uiImage: project.photo ?? .logo)
                                        .resizable()
                                        .frame(width: 200, height: 150)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                            }
                        }
                    }
                    Spacer()
                }
                
                NavigationLink {
                    AllImageView(project: project, vm: vm)
                } label: {
                    Text("See all")
                        .foregroundStyle(.white)
                        .font(.title2)
                    
                }
                
                //MARK: - Notes project
                HStack{
                    Button {
                        vm.isPresentAddNote = true
                    } label: {
                        PlusButtomView()
                    }
                    if let notes = project.note?.allObjects as? [NoteProject]{
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(notes) { note in
                                    Button {
                                        vm.isPresentAddNote = true
                                        vm.feelNoteData(note: note)
                                    } label: {
                                        NoteCellView(note: note)
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }

                Spacer()
                
                HStack{
                    //MARK: - Delete buttom
                    Button(action: {
                        vm.deleteProject(project: project)
                    }) {
                        Image(systemName: "trash.square.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.red)
                    }
                    
                    //MARK: - Edit buttom
                    NavigationLink {
                        ProjectCreateView(vm: vm).onAppear {
                            vm.feellProjectData(project: project)
                        }
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.yellowApp)
                    }
                }
            }
            .padding()
            .navigationTitle("Project")
            .navigationBarTitleDisplayMode(.inline)
            
            //MARK: - Add note view
            if vm.isPresentAddNote {
                AddNoteView(vm: vm, project: project)
            }
        }
    }
}

#Preview {
    ProjectView(project: Project(), vm: ProjectViewModel())
}
