//
//  SettingsView.swift
//  CryptoTrack
//
//  Created by Роман on 07.11.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @StateObject var vm = SettingsViewModel()
    var body: some View {
        ZStack {
            //MARK: - back ground
            Color.black.ignoresSafeArea()
            
            //MARK: - Main stack
            VStack {
               
                    //MARK: - Share App Button
                    Button(action: {vm.isPresentShare.toggle()}, label: {
                        SettingButtonView(text: "Share the app")
                    })
                    
                    //MARK: - Rate App Button
                    Button {
                        SKStoreReviewController.requestReview()
                    } label: {
                        SettingButtonView(text: "Rate us")
                    }
                    
                    //MARK: - Privacy button
                    Button(action: {
                        vm.isPresentPolicy = true
                        print("policy: \(vm.isPresentPolicy)")
                    }, label: {
                        SettingButtonView(text: "Usage policy")
                    })
                
                Spacer()
                
                
            }
            .padding()
            
            .sheet(isPresented: $vm.isPresentShare, content: {
                ShareSheet(items: vm.urlShare )
            })
        }
        .sheet(isPresented: $vm.isPresentPolicy, content: {
            WebViewPage(urlString: URL(string:vm.urlPolicy)!)
        })
    }
}

#Preview {
    SettingsView()
}

struct ShareSheet: UIViewControllerRepresentable{
    var items: String
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let av = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return av
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
