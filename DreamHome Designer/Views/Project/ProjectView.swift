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
                    Button {
                        
                    } label: {
                        PlusButtomView()
                    }
                    if let photos = project.photo?.allObjects as? [PhotoProject]{
                        ScrollView(.horizontal) {
                            ForEach(photos.prefix(3)) { project in
                                Image(uiImage: project.photo ?? .logo)
                                    .resizable()
                                    .frame(width: 200, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
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
                    PlusButtomView()
                    
                    if let notes = project.note?.allObjects as? [NoteProject]{
                        ScrollView(.horizontal) {
                            ForEach(notes) { note in
                                VStack{
                                    Text(note.title ?? "")
                                        .font(.title3)
                                    Text(note.text ?? "")
                                }.foregroundStyle(.white)
                            }
                        }
                    }
                    
                    Spacer()
                }

                Spacer()
                
                HStack{
                    //MARK: - Delete buttom
                    Button(action: {
                       /// delete
                    }) {
                        Image(systemName: "trash.square.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.red)
                    }
                    
                    //MARK: - Edit buttom
                    Button(action: {
                       /// edit
                    }) {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.yellowApp)
                    }
                }
            }.padding()
            .navigationTitle("Project")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProjectView(project: Project(), vm: ProjectViewModel())
}
