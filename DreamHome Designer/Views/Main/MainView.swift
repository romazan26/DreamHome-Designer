//
//  MainView.swift
//  DreamHome Designer
//
//  Created by Роман on 19.11.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vmHome = HomeViewModel()
    @StateObject var vmProject = ProjectViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    switch vmHome.selectedVew {
                    case 1: HomeView(vm: vmHome, vmProject: vmProject)
                    case 2: ProjectsView(vm: vmProject)
//                    case 3: NewsView(vm: vmNews)
                    default:
                        SettingsView()
                    }
                    
                    Spacer()
                    
                    //MARK: - TabBar
                    CustomTabBarView(selectedTab: $vmHome.selectedVew)
                        
                        
                }.padding()
            }
        }
    }
}

#Preview {
    MainView()
}
