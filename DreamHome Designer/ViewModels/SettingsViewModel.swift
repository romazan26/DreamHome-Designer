//
//  SettingsViewModel.swift
//  CryptoTrack
//
//  Created by Роман on 07.11.2024.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    //MARK: - Settings Propertyes
    @Published var isPresentShare = false
    @Published var isPresentPolicy = false
    @Published var urlShare = "https://www.apple.com/app-store/"
    @Published var urlPolicy = "https://www.apple.com/app-store/"
    
}
