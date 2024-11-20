//
//  ProjectCellView.swift
//  DreamHome Designer
//
//  Created by Роман on 20.11.2024.
//

import SwiftUI

struct ProjectCellView: View {
    @ObservedObject var project: Project
    var body: some View {
        ZStack {
            Image(systemName: "photo.artframe")
                .resizable()
                .foregroundStyle(.gray)
            VStack {
                //MARK: Style
                HStack {
                    Spacer()
                    Text(project.type ?? "")
                        .foregroundStyle(.black)
                        .font(.system(size: 11))
                        .padding(5)
                        .background {
                            Color.yellowApp
                                .cornerRadius(8)
                        }
                }
                Spacer()
                
                //MARK: Name end type
                HStack{
                    Text(project.name ?? "")
                        .font(.system(size: 12))
                    Spacer()
                    Image(systemName: project.type == "Interior" ? "house.fill" : "bed.double.fill")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                .foregroundStyle(.white)
                .background {
                    Color.black
                        .blur(radius: 8)
                }
            }.padding(5)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .frame(width: 171, height: 96)
    }
}

//#Preview {
//    ProjectCellView(project: Project())
//}
