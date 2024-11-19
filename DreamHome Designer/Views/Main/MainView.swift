//
//  MainView.swift
//  DreamHome Designer
//
//  Created by Роман on 19.11.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vmHome = HomeViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    switch vmHome.selectedVew {
                    case 1: HomeView()
//                    case 2: FavoritesCoinsView(vm: vmHome)
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
