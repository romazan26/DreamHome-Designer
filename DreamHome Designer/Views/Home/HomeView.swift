//
//  MainView.swift
//  DreamHome Designer
//
//  Created by Роман on 19.11.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView {
                VStack {
                    //MARK: - Title view
                    Text("“Your dream home starts here„")
                        .foregroundStyle(.white)
                        .font(.system(size: 28, weight: .heavy))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background {
                            Color.white.opacity(0.05)
                                .cornerRadius(12)
                        }
                    
                    //MARK: - Info of progect
                    InfoTableView()
                    
                    //MARK: - Project buttoms
                    HStack{
                        
                        VStack {
                            Image(.myProfectIcon)
                                .resizable()
                                .frame(width: 171, height: 180)
                            Text("My project")
                                .foregroundStyle(.white)
                                .offset(y: -10)
                                .shadow(radius: 20)
                        }
                        Spacer()
                        VStack {
                            Image(.addNewProjectIcon)
                                .resizable()
                                .frame(width: 171, height: 180)
                            Text("Add new project")
                                .foregroundStyle(.white)
                                .offset(y: -10)
                                .shadow(radius: 20)
                        }
                    }
                    
                    //MARK: - Last progect
                    VStack{
                        HStack{
                            Text("Last project")
                                .foregroundStyle(.white)
                                .font(.system(size: 22, weight: .heavy))
                            Spacer()
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 25, height: 22)
                                .foregroundStyle(.white)
                        }
                        
                        Text("You don't have any projects yet")
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: 170)
                            .padding()
                    }
                }
            }
            
        }
    }
}

#Preview {
    HomeView()
}
