//
//  CustomTabBarView.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: Int
    var body: some View {
        HStack {
            Spacer()
            
            //MARK: Home button
            Button(action: {
                selectedTab = 1
            }) {
                VStack {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(selectedTab == 1 ? .black : .gray)
                        
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    Text("Home")
                        .foregroundColor(selectedTab == 1 ? .black : .gray)
                }
                
                .padding(10)
                .frame(maxWidth: .infinity)
                
                .background(selectedTab == 1 ? Color.yellowApp : Color.clear)
                .cornerRadius(20)
            }
            
            Spacer()
            
            //MARK: Project button
            Button(action: {
                selectedTab = 2
            }) {
                VStack {
                    Image(systemName: "text.document.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(selectedTab == 2 ? .black : .gray)
                        
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    Text("Project")
                        .foregroundColor(selectedTab == 2 ? .black : .gray)
                }
                
                .padding(10)
                .frame(maxWidth: .infinity)
                
                .background(selectedTab == 2 ? Color.yellowApp : Color.clear)
                .cornerRadius(20)
            }

            Spacer()
            
            //MARK: Settings button
            Button(action: {
                selectedTab = 3
            }) {
                VStack {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(selectedTab == 3 ? .black : .gray)
                        
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    Text("Settings")
                        .foregroundColor(selectedTab == 3 ? .black : .gray)
                }
                
                .padding(10)
                .frame(maxWidth: .infinity)
                
                .background(selectedTab == 3 ? Color.yellowApp : Color.clear)
                .cornerRadius(20)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .background {
            Color.white.opacity(0.05).cornerRadius(8)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        CustomTabBarView(selectedTab: .constant(1))
            //.padding()
    }
}
