//
//  ContentView.swift
//  DreamHome Designer
//
//  Created by Роман on 19.11.2024.
//

import SwiftUI

struct LoadingView: View {
    @StateObject var vm = LoadingViewModel()
    var body: some View {
        ZStack {
            Color.yellowApp.ignoresSafeArea()
            Image(.logo)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(20)
            ProgressView()
                .colorScheme(.light)
                .padding(.top, 350)
        }
        .fullScreenCover(isPresented: $vm.isPresent, content: {
            if vm.isConnected {
                WebViewPage(urlString: (URL(string: vm.urlString)!))
            }else if vm.isFirstLaunch ?? true {
            IntroView()
        }else{
            MainView()
        }
        })
        .onAppear(perform: {
            vm.starttimer()
        })
    }
}

#Preview {
    LoadingView()
}
